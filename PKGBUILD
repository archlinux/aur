# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bruce Zhang

pkgname=vkd3d-proton-git
pkgver=v2.1.r38.g2560c768
pkgrel=1
pkgdesc='Direct3D 12 to Vulkan translation library By WineHQ'
arch=('x86_64')
url='https://wiki.winehq.org/Vkd3d'
license=('LGPL')
depends=('spirv-tools' 'vulkan-icd-loader')
makedepends=('git' 'meson' 'glslang' 'wine' 'xcb-util-keysyms' 'xorgproto')
source=("git+https://github.com/HansKristian-Work/vkd3d-proton.git")
provides=('vkd3d-proton')
conflicts=('vkd3d-proton')
md5sums=('SKIP')

pkgver() {
    cd vkd3d-proton
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    cd vkd3d-proton
    git submodule update --init --recursive
}

package() {
  cd vkd3d-proton
  meson --buildtype release --prefix /usr build.64
  DESTDIR=$pkgdir ninja -C build.64 install
}
