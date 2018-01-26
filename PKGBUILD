# Maintainer: itsme <mymail@ishere.ru>


pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.5.0
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('python-pip' 'git')
depends=('python' 'xorg-xrandr')
optdepends=('bash-completion')
source=("https://github.com/edio/$pkgname/archive/$pkgver.tar.gz")
md5sums=('48c2ed618df07e8df8f9348f1553a686')
sha256sums=('bec160af7da86052f47ce2e8aed2101738ff4e012af2cefaa450cebfd1868dd2')
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
