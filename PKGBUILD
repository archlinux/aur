# Maintainer: Joshua Rubin <me at jawa dot dev>

pkgname=jtdx
pkgver=rc155
pkgrel=1
pkgdesc='For amateur radio communication using very weak signals. Forked from WSJT-X.'
arch=('x86_64')
url='https://github.com/jtdx-project/jtdx'
license=('GPL3')
depends=('fftw' 'portaudio' 'hamlib' 'qt5-serialport' 'qt5-multimedia')
makedepends=('cmake' 'asciidoctor' "jtdxhamlib=${pkgver}" 'gcc9' 'gcc9-fortran' 'qt5-tools' 'asciidoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jtdx-project/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('2bc653a120a424afc15a98b85f4362ec')
sha1sums=('c9bdaecc4643031baebb05a4a032a01236b7f4fa')
sha224sums=('4e440091bd07b3f5b2de65b10755903215970106ac73cf38a9adebab')
sha256sums=('4ae2675ead697888ddd23645eaf22bf97d3e1803af2ba18061489c978956287d')
sha384sums=('17a6ac9d6cd1a1c3add399dc6e5e2f4fbb0c354fae79d5a792f76636c1b757bd7a7a189826ee1b32ffb41e1a19df6fbd')
sha512sums=('6fcf99bdb97481d3764c4a258afc041abfb7af6b89727844255b91e91b4d6223654c49930eaea9d3a51e8ef41716e512ab783853dd2ff1055b2709ae663efebe')
b2sums=('a7df3e036134203e9da4cacc5f96a771f504f4c74d7c01861cbd6260f6455f5044cc251b9bbfb2175b7165c841f4c244e63bfc285b2fb49f0586377cefe65021')

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
