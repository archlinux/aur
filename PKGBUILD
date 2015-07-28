# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libdcp
pkgver=1.1.0
pkgrel=1
pkgdesc="A small C++ library which can create and read Digital Cinema Packages using JPEG2000 and WAV files"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libdcp"
license=('GPL')
depends=('openssl' 'libxml++>=2.6' 'xmlsec' 'openjpeg' 'libcxml>=0.12.0' 'libsigc++>=2.0' 'boost-libs>=1.45')
makedepends=('python2' 'boost>=1.45')
source=("http://carlh.net/downloads/${pkgname}/${pkgname}-${pkgver}.tar.bz2"  "libdcp-1.1.0-arch-mk1.patch")
sha256sums=('646f98666f427900dee58d48440e3c8fb440e11158b92dccacd1b9885a1561a2'
            '61fae76f13c39807781c02c719a0934ee290cf507baefd9ce0b161a4fbc3a716')



prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i  "${srcdir}/libdcp-1.1.0-arch-mk1.patch"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
}

