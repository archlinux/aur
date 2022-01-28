# Maintainer: Wolfizen <wolfizen@wolfizen.net>
# Contributor: Narrat <autumn-wind@web.de>
# Contributor: itsme <mymail@ishere.ru>

pkgname=randrctl
pkgdesc="Lightweight profile based screen manager for X"
pkgver=1.9.0
pkgrel=1
arch=('any')
url="http://github.com/edio/randrctl"
license=('GPL3')
makedepends=('python-pip' 'git')
depends=('python' 'xorg-xrandr' 'python-yaml')
optdepends=('bash-completion')
install="randrctl.install"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/edio/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('aa5d20dea6c3bef3c3e92cb14569e2e3f8e8c0a44a0467c0d31e1931c6729431')


build() {
  cd $pkgname-$pkgver

  python setup.py build
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  python -m randrctl setup completion > bash_completion

  install -Dm644 randrctl/setup/config.yaml "$pkgdir/etc/randrctl/config.yaml"
  install -Dm644 randrctl/setup/99-randrctl.rules "$pkgdir/usr/lib/udev/rules.d/99-randrctl.rules"
  install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/randrctl"
}

# vim:set ts=2 sw=2 et:
