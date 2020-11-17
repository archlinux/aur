# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=pythondata-cpu-microwatt
pkgname="python-$_srcname-git"
pkgver=2020.08.r219.gd695ff9
pkgrel=1
pkgdesc="Python module containing vhdl files for microwatt cpu (for use with LiteX)"
arch=(any)
url="https://github.com/litex-hub/pythondata-cpu-microwatt"
license=('custom:CC-BY 4.0')
depends=(python)
makedepends=(git python-setuptools)
provides=("${pkgname%%-git}=$pkgver")
conflicts=("${pkgname%%-git}")
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

  install -Dm644 "${_srcname//-/_}/vhdl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et ts=2 syntax=PKGBUILD:
