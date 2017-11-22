# Maintainer: itsme <mymail@ishere.ru>


pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.4.0
pkgrel=2
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('python-pip' 'git')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=("https://github.com/edio/$pkgname/archive/$pkgver.tar.gz")
md5sums=('ed827785fd7b804c6a71506cac0027d4')
sha256sums=('4480708de01d9bbcb554fa4f32c32b394113f8341ab658699f5b4d86b2212028')
conflicts=("$pkgname-git")
install="randrctl.install"


package() {
  cd $srcdir/$pkgname-$pkgver

  # PKGBUILD handles setup
  rm bin/randrctl-setup

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 randrctl/misc/config.ini "$pkgdir/etc/randrctl/config.ini"
  install -Dm644 randrctl/misc/completion/zsh/_randrctl "$pkgdir/usr/share/zsh/site-functions/_randrctl"
  install -Dm644 randrctl/misc/completion/bash/randrctl "$pkgdir/usr/share/bash-completion/completions/randrctl"
  install -Dm644 randrctl/misc/udev/99-randrctl.rules "$pkgdir/usr/lib/udev/rules.d/99-randrctl.rules"
}

# vim:set ts=2 sw=2 et:
