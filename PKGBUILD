# Maintainer: Emil Velikov <emil.l.velikov@gmail.com>
# Contributor: Christoph Haag <haagch+aur@frickel.club>

pkgname='vkmark-git'
pkgdesc='Vulkan benchmark'
pkgver=2025.01.r13.g83a128d
pkgrel=2
url='https://github.com/vkmark/vkmark'
arch=('i686' 'x86_64')
provides=('vkmark')
conflicts=('vkmark')
license=('LGPL-2.1-or-later')
depends=('vulkan-icd-loader' 'assimp' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'vulkan-headers' 'meson' 'glm' 'wayland-protocols' 'xorgproto' 'xcb-util-wm' 'wayland')
optdepends=(
  'xcb-util-wm: for X11 support'
  'libxcb: for X11 support'
  'libdrm: for KMS support'
  'mesa: for KMS support'
  'wayland: for Wayland support'
)
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

