# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=vkd3d-git
pkgver=1.0.13.g265ce37
pkgrel=1
pkgdesc="D3D12 to Vulkan translation library. (GIT version)"
arch=('x86_64')
url='https://source.winehq.org/git/vkd3d.git'
license=('LGPL')
depends=('spirv-tools'
         )
makedepends=('spirv-headers')
conflicts=('vkd3d')
provides=('vkd3d')
source=('git+http://source.winehq.org/git/vkd3d.git')
sha256sums=('SKIP')

pkgver() {
  cd vkd3d
  echo "$(git describe --long --tags | tr - . | sed 's|vkd3d.||')"
}

prepare() {
  mkdir -p build

  cd vkd3d

  ./autogen.sh

  cd ../build
  ../vkd3d/configure \
    --prefix=/usr \
    --with-spirv-tools

}

build() {
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
