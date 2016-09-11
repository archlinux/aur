# Maintainer: itsme <mymail@ishere.ru>


pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.2
pkgrel=2
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=("https://github.com/edio/$pkgname/archive/$pkgver.tar.gz")
md5sums=('75597fdab3a4cf0a94707024ec2c6251')
sha256sums=('f5f0d5fe8af2ee21797bd4fd3430e3227edc9c7bc345c8ff872391478c4c0c07')
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
