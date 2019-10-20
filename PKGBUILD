# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml
pkgver=0.16.1
pkgrel=2
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="https://carlh.net/libcxml"
license=('GPL')
depends=('libxml++2.6' 'boost-libs>=1.61.0' 'libasdcp-cth>=0.1.3' 'liblocked-sstream>=0.0.5')
makedepends=('python2' 'pkg-config' 'boost')
source=("${pkgname}-${pkgver}.tar.bz2::https://carlh.net/downloads/libcxml/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('664b97fa8add07f97b0354acc5991f4fc214bfbdaba169508298fd17f381dae7')


build() {
    CXXFLAGS="$CXXFLAGS -std=c++11"
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 waf configure --prefix=/usr
    python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
