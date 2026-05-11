# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libsub
pkgver=1.6.61
pkgrel=1
pkgdesc="a small C++ library to read and write subtitles in a few different formats (currently STL, SubRip and DCP)"
arch=('i686' 'x86_64')
url="https://carlh.net/libsub"
license=('GPL-2.0-or-later')
depends=('boost-libs>=1.91.0' 'fmt')
makedepends=('python' 'boost>=1.91.0' 'openssl' 'git')
provides=('libsub')
conflicts=('libsub')
source=("${pkgname}-${pkgver}::git+https://git.carlh.net/git/${pkgname}.git#tag=v${pkgver}")
sha256sums=('408afcbf64e518bf607d0292693d2866d0b1ddef9d20ab2cc45bebd6493c6ebf')

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
