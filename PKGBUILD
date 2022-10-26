# Maintainer: Christoph Haag <haagch+aur@frickel.club>
pkgname='vkmark-git'
pkgdesc='Vulkan benchmark'
pkgver=r133.30d2cd3
pkgrel=2
url='https://github.com/vkmark/vkmark'
arch=('i686' 'x86_64')
provides=('vkmark')
conflicts=('vkmark')
license=('LGPL2.1')
depends=('vulkan-icd-loader' 'assimp')
makedepends=('git' 'vulkan-headers' 'meson' 'ninja' 'glm' 'wayland-protocols' 'xorgproto' 'xcb-util-wm' 'wayland')
optdepends=('xcb-util-wm: for X11 support'
            'wayland: for Wayland support')
source=('git+https://github.com/vkmark/vkmark.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/vkmark
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/vkmark

  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd "${srcdir}"/vkmark
  DESTDIR="$pkgdir" ninja -C build install
}

