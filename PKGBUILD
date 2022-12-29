# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.6.42
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL')
depends=('openssl' 'libxml++2.6' 'xmlsec' 'libsigc++>=2.0' 'boost-libs>=1.72.0')
makedepends=('python' 'boost>=1.72.0')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}.tar.bz2::https://git.carlh.net/gitweb/?p=${pkgname}.git;a=snapshot;h=v${pkgver};sf=tgz")
sha256sums=('6e7d9ff14d671d476c27480a8b1f4e40e22c367386accf061dd426c2fa514752')

prepare() {
  cd "${srcdir}"
  mv "${pkgname}-v${pkgver}-"* "${pkgname}-${pkgver}"
}

build() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
