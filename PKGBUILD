# Maintainer: Hao Zhang <hao [at] hao-zhang [dot] com>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.20
pkgrel=1
pkgdesc="A Python binding for QuantLib."
arch=("i686" "x86_64")
url="http://quantlib.org"
license=("BSD")
options=(!libtool)
depends=("quantlib>=1.20" "python")
makedepends=("make"  "gcc" "boost")
source=(https://bintray.com/quantlib/releases/download_file?file_path=$_pkgname-$pkgver.tar.gz)
sha256sums=("00b01e4e30906dcc4ef2b8768bd2ad3dd7e08b248a6ff5743253802c027728f8")

build() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  sed -i "s#boost::dynamic_pointer_cast#ext::dynamic_pointer_cast#g" Python/QuantLib/quantlib_wrap.cpp
  ./configure --prefix=/usr
  make -C Python
}

package() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  sed -i "s#setup.py install#setup.py install --root=\"${pkgdir}\"#g" Python/Makefile
  make -C Python install
}
