# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=pythondata-cpu-cv32e40p
pkgname="python-$_srcname-git"
pkgver=2020.08.r1.gb8fe3c4
pkgrel=1
pkgdesc="Python module containing system_verilog files for cv32e40p cpu (for use with LiteX)"
arch=(any)
url="https://github.com/litex-hub/pythondata-cpu-cv32e40p"
license=('custom:Solderpad')
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

  install -Dm644 "${_srcname//-/_}/system_verilog/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et ts=2 syntax=PKGBUILD:
