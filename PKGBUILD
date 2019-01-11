# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libyaml
_pkgname=libyaml
pkgver=0.2.1
pkgrel=2
pkgdesc="YAML 1.1 library (32-bit)"
arch=('x86_64')
url="https://pyyaml.org/wiki/LibYAML"
license=('MIT')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=("https://pyyaml.org/download/libyaml/yaml-${pkgver}.tar.gz")
sha256sums=('78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd')

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
