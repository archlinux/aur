# Maintainer: Christoph Haag <haagch+aur@frickel.club>
pkgname='vkmark-git'
pkgdesc='Vulkan benchmark'
pkgver=r127.53abc4f
pkgrel=1
url='https://github.com/vkmark/vkmark'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('vulkan-icd-loader' 'libpng' 'mesa' 'assimp' 'xcb-util-wm')
makedepends=('git' 'vulkan-headers' 'meson' 'ninja' 'glm' 'vulkan-hpp')
source=('git+https://github.com/vkmark/vkmark.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/vkmark
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/vkmark
}

build() {
  cd "${srcdir}"/vkmark

  rm -rf build
  meson --prefix=/usr build || true # if you remove rm -rf build before, meson build will thrown an error if build exists from previous builds
  ninja -C build
}

package() {
  cd "${srcdir}"/vkmark
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf "$pkgdir"/usr/local/share/man
}

