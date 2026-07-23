# Maintainer: ralf <ralf.wierzbicki@gmail.com>
pkgname=asteroidz-scenefx
pkgver=0.17.3
pkgrel=1
pkgdesc='scenefx fork for asteroidz — wlroots effects library with GLES2 and Vulkan (fx_vk) renderers'
arch=('x86_64')
url='https://github.com/asteroidzman/asteroidz-scenefx'
license=('MIT')
depends=('wlroots0.20' 'wayland' 'libdrm' 'libxkbcommon' 'pixman' 'vulkan-icd-loader')
makedepends=('meson' 'ninja' 'wayland-protocols' 'vulkan-headers' 'glslang' 'git')
provides=('asteroidz-scenefx' 'libasteroidz-scenefx-0.5.so')
conflicts=('asteroidz-scenefx')
# Renamed fork: installs as libasteroidz-scenefx-0.5 / asteroidz-scenefx-0.5.pc,
# so it does NOT conflict with an upstream `scenefx` package.
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build \
    -Drenderers=gles2,vulkan \
    -Db_lto=true \
    -Dexamples=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
