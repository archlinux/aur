# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libyaml
_pkgname=libyaml
pkgver=0.2.2
pkgrel=1
pkgdesc="YAML 1.1 library (32-bit)"
arch=('x86_64')
url="https://pyyaml.org/wiki/LibYAML"
license=('MIT')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/yaml/libyaml/archive/${pkgver}.tar.gz")
sha256sums=('46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe')

prepare() {
  cd "${srcdir}/libyaml-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libyaml-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libyaml-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf ${pkgdir}/usr/{include,share}
}
