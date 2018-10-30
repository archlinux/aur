# Maintainer: Bruce Zhang
pkgname=lib32-vkd3d
_pkgname=vkd3d
pkgver=1.1
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ (lib32)'
arch=('x86_64')
url='https://www.winehq.org/news/2018052301'
license=('LGPL')
source=("https://dl.winehq.org/vkd3d/source/vkd3d-${pkgver}.tar.xz")
makedepends=('spirv-headers-git' 'vulkan-headers' 'lib32-xcb-util-keysyms')
depends=('libtool' 'glibc')
sha1sums=('00e784c2112acec0b8ef80ea547ed09c136335e8')
install=lib32-vkd3d.install

prepare() {
  cd "${srcdir}/vkd3d-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'

  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS="-L/usr/lib32"

  ./configure --prefix=/usr --libdir=/usr/lib32
}

build() {
  cd "${srcdir}/vkd3d-${pkgver}"
  make
}

package() {
  cd "${srcdir}/vkd3d-${pkgver}"
  make DESTDIR="${pkgdir}" install
  cd ${pkgdir}
  rm -rf ./usr/include/vkd3d
}
