# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=litex-boards
pkgname="python-$_srcname-git"
pkgver=2020.12.r26.gbee71da
pkgrel=1
pkgdesc="LiteX supported boards"
arch=(any)
url="https://github.com/litex-hub/litex-boards"
license=('BSD')
depends=(python python-migen python-litex)
makedepends=(git python-setuptools)
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
replaces=("$_srcname-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcname"
  python setup.py build
}

package() {
  cd "$_srcname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et ts=2 syntax=PKGBUILD:
