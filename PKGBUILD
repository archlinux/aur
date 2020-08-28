# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=jtdx
pkgver=rc152
pkgrel=1
pkgdesc='For amateur radio communication using very weak signals. Forked from WSJT-X.'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdx'
license=('GPL3')
depends=('fftw' 'portaudio' 'hamlib' 'qt5-serialport' 'qt5-multimedia')
makedepends=('cmake' 'asciidoctor' "jtdxhamlib=${pkgver}" 'gcc9' 'gcc9-fortran')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jtdx-project/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('06c8d1a5c6ad9adb7110423dd1d9ecbc')
sha1sums=('a90e6f873e4bf57f4d075cee2cbf9d9ace5d9b59')
sha224sums=('69df9641a927a5d31bea6c151ea287f48ca2321bc8d7f24f9967983e')
sha256sums=('066f5f15f5fdd97f641d9e47a8cf65e138e88cc655d10b9cdbbe6a4099883a42')
sha384sums=('4a42f5e5ca477ef719163ac1a18f15be7e72cccff00b13fb67875d0e3cd4313dd0547d163561d641977c8847ff239a7a')
sha512sums=('70470100e41d4f730d79f875372c2cd008a76d105d0378b267d99801ff57f243389b04e204550f28478e65c2df3d1220c70bd7e036b97d2a3e26cf931b6283ee')
b2sums=('2e2c5f6f474ca19c42f5c5180468de86b2ae58edc4189533042b39a37e7b67e02e7f7a704bd9c426cfa55a0c50cb2ec25379d74c3049db20988f5832b9d7ddfe')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build

  export CC=/usr/bin/gcc-9
  export CXX=/usr/bin/g++-9
  export FC=/usr/bin/gfortran-9
  cmake \
    -D CMAKE_PREFIX_PATH=/opt/jtdxhamlib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install
}
