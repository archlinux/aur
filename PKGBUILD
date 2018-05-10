# Maintainer: itsme <mymail@ishere.ru>


pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.6.0
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('python-pip' 'git')
depends=('python' 'xorg-xrandr' 'python-yaml')
optdepends=('bash-completion')
source=("https://github.com/edio/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e5b8e2fc0184b3eaf990398c776e2f75b900ad964b2e48601f90f1bd95e75734')
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
