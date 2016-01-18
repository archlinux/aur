# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: alucryd <alucryd at gmail dot com>
# Contributor: Jan Cholasta <grubber at grubber dot cz>
# Contributor: scj <scj at archlinux dot us>
# Contributor: Sven-Hendrik Haase <sh at lutzhaase dot com>

pkgname=sfml1.6
pkgver=1.6
pkgrel=7
pkgdesc="A simple, fast, cross-platform, and object-oriented multimedia API"
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org/"
license=('zlib')
depends=('freetype2' 'glew' 'libjpeg' 'libsndfile' 'libxrandr' 'mesa' 'openal' 'soil')
source=("http://www.sfml-dev.org/files/SFML-${pkgver}-sdk-linux-32.tar.gz"
        'various-fixes.patch')
sha256sums=('b1c18f9b99c54ebb4cd433792f33ed2b85c846cca28eb871a12b3191dc1532f8'
            '8f9d10c6fa027928d222f00425d8115c66da0bea601d80204f7de160006f4eb4')

prepare() {
  cd SFML-${pkgver}

  patch -Np1 -i ../various-fixes.patch
}

build() {
  cd SFML-${pkgver}

  make
}

package() {
  cd SFML-${pkgver}

  make DESTDIR="${pkgdir}" install

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 {,"${pkgdir}"/usr/share/licenses/${pkgname}/}license.txt
}

# vim: ts=2 sw=2 et:
