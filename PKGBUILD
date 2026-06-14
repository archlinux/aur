# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Christoph Haag <haagch+aur@frickel.club>

pkgname='vkmark-git'
pkgdesc='Vulkan benchmark'
pkgver=2025.01.r13.g83a128d
pkgrel=1
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
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

