# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libyaml
_pkgname=libyaml
pkgver=0.2.4
pkgrel=1
pkgdesc="YAML 1.1 library (32-bit)"
arch=('x86_64')
url="https://pyyaml.org/wiki/LibYAML"
license=('MIT')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/yaml/libyaml/archive/${pkgver}.tar.gz")
sha256sums=('02265e0229675aea3a413164b43004045617174bdb2c92bf6782f618f8796b55')

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
