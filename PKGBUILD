# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com>

pkgname=python-quantlib
_pkgname=QuantLib-SWIG
pkgver=1.15
pkgrel=1
pkgdesc="A Python binding for QuantLib."
arch=("i686" "x86_64")
url="http://quantlib.org"
license=("BSD")
options=(!libtool)
depends=("quantlib>=1.11" "python")
makedepends=("make"  "gcc")
source=(https://bintray.com/quantlib/releases/download_file?file_path=$_pkgname-$pkgver.tar.gz)
sha256sums=("bb177822d473c8bd87579ef39b261ca32227fb5492ebd5e21db2e8f090cbc8c6")

build() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  ./configure --prefix=/usr
  make -C Python
}

package() {
  cd "$srcdir"/"$_pkgname-$pkgver"/
  sed -i "s#setup.py install#setup.py install --root=\"${pkgdir}\"#g" Python/Makefile
  make -C Python install
}
