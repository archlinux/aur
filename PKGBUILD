# Maintainer: watasuke <watasuke102@gmail.com>

pkgname=zennist
pkgver=0.1.2
pkgrel=1
pkgdesc='Launcher and environment application for the Zen 3D compositor'
arch=('x86_64' 'aarch64')
url='https://github.com/zwin-project/zennist'
license=('MIT' 'CC-BY-4.0')
depends=('zukou' 'cairo' 'libjpeg-turbo' 'libpng' 'librsvg' 'glib2' 'gcc-libs' 'glibc')
makedepends=('meson' 'glm' 'libglvnd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7ab807242c21cd6a69eecba6900d892ce58fe682896f4565f8e8866c869b2f4f')

build() {
  arch-meson "$pkgname-$pkgver" build -Dwerror=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$pkgname-$pkgver/3rd-party/tomlc17/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.tomlc17"
}
