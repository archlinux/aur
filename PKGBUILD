# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.17.11
pkgrel=1
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="https://carlh.net/libcxml"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.86.0' )
makedepends=('git' 'python' 'pkg-config' 'boost')
source=("$pkgname-$pkgver::git+git://git.carlh.net/git/libcxml.git#tag=v$pkgver")
sha256sums=('e1295391f989421a37ca9ca9babce42032cd39287b16d78138a01d81f345c464')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python waf configure --prefix=/usr
    python waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir="$pkgdir"
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
