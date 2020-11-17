# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_srcname=pythondata-cpu-serv
pkgname="python-$_srcname-git"
pkgver=2020.08.r38.g2428c0c
pkgrel=1
pkgdesc="Python module containing verilog files for serv cpu (for use with LiteX)"
arch=(any)
url="https://github.com/litex-hub/pythondata-cpu-serv"
license=('ISC')
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

  install -Dm644 "${_srcname//-/_}/verilog/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set et ts=2 syntax=PKGBUILD:
