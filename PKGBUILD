# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libyaml
_pkgname=libyaml
pkgver=0.2.1
pkgrel=1
pkgdesc="YAML 1.1 library (32-bit)"
arch=('x86_64')
url="http://pyyaml.org/wiki/LibYAML"
license=('MIT')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('lib32-gcc-libs')
source=("http://pyyaml.org/download/libyaml/yaml-${pkgver}.tar.gz")
md5sums=('72724b9736923c517e5a8fc6757ef03d')

build() {
  cd "${srcdir}/yaml-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/yaml-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf ${pkgdir}/usr/{include,share}
}
