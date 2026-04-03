# Maintainer: ralgar (me@ralgar.dev)
pkgname='vkshade'
pkgver=0.0.9
pkgrel=1
pkgdesc='A ReShade-compatible Vulkan post-processing layer'
arch=('x86_64')
url='https://github.com/ralgar/vkShade'
license=('BSD-2-Clause')
depends=('libinih' 'libx11' 'libxcb' 'libxkbcommon' 'spdlog' 'wayland')
makedepends=('git' 'glm' 'meson' 'ninja' 'vulkan-headers' 'vulkan-utility-libraries')
optdepends=('reshade-shaders-git')
source=("vkshade-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('041649948693fecccb50f15b2a265b54752811c7217855e28b397efae44c322d')

prepare() {
  cd ${srcdir}/vkShade-${pkgver}
  meson setup --prefix=/usr --buildtype=release build
}

build() {
  cd ${srcdir}/vkShade-${pkgver}
  ninja -C build
}

package() {
  cd ${srcdir}/vkShade-${pkgver}

  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
