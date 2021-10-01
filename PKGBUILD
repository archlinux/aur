# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=jtdx
pkgver=2.2.156
_pkgver=156_corrected
pkgrel=2
pkgdesc='For amateur radio communication using very weak signals. Forked from WSJT-X.'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdx'
license=('GPL3')
depends=('fftw' 'portaudio' 'hamlib' 'qt5-serialport' 'qt5-multimedia' 'qt5-websockets')
makedepends=('cmake' 'asciidoctor' "jtdxhamlib=4.2" 'gcc9' 'gcc9-fortran' 'qt5-tools' 'asciidoc')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/jtdx-project/${pkgname}/archive/${_pkgver}.tar.gz")
md5sums=('9c611338694c5f72ca3ab2898dae7f4e')
sha1sums=('8c18fd61d7eead992ecc7a7bc3fb72a06485929e')
sha224sums=('516dfac23b94fc6a0c2abe747d8e9ff7811da4382175173e234b41c2')
sha256sums=('4c734b44a4d60c1d1aae40bff3e609f1559dd3ad3cbdd1994e63d6f349461f94')
sha384sums=('68261e847b1d2f408a16c9ddd67c806273ab039b35905ea12480eef53036ffd6d99f79777c11790c956ca6e33ae03e32')
sha512sums=('ae4d21b28bb47e6c45685c40893374138d79005c49499fc2b4435fab1f8903083d3c8f94d784e2eb8543e258717563c4ca9d3374b6732f6d6be0f6f05af981f7')
b2sums=('b3d6e7d065bf1a53266f8d0b4ed328ed20b383fed3b65e42298b5d21585ea35238993e902b56a31053eda2ddba2838ccbeb10b9f780384a18b873775da1be6ca')

build() {
  cd "${pkgname}-${_pkgver}"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -D CMAKE_PREFIX_PATH=/opt/jtdxhamlib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
