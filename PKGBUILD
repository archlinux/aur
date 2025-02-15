# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.6.53
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL-2.0-or-later')
depends=('boost-libs>=1.86.0')
makedepends=('python' 'boost>=1.86.0' 'openssl')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}::git+git://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('d1e45f234630fd7a9ac286df81a2aa524e2c20db9829c3b40bbe683e2a80785f')

build() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf configure --prefix=/usr --disable-tests
  python waf build
}

package() {
  cd  "${srcdir}/${pkgname}-${pkgver}"
  python waf install --destdir="$pkgdir"
  cd "${pkgdir}"
  if [ -d usr/lib64   ]
    then
       mv usr/lib64 usr/lib
    fi
}
