# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gpuvis
pkgver=0.1
pkgrel=1
pkgdesc="GPU trace visualizer"
arch=('x86_64')
url="https://github.com/mikesart/gpuvis"
license=('MIT')
depends=('freetype2' 'gtk3' 'rapidjson' 'sdl2')
makedepends=('meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('68061fc7afa996772d19098d4e1cfa090ce731a293ef9956dec1301daf15037e')

build() {
  arch-meson gpuvis-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 gpuvis-$pkgver/gpuvis.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 gpuvis-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
