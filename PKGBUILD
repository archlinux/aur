# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=gpuvis-git
pkgver=0.1+6.g8c4eddaa2e
pkgrel=1
pkgdesc="GPU trace visualizer"
arch=('x86_64')
url="https://github.com/mikesart/gpuvis"
license=('MIT')
depends=('freetype2' 'gtk3' 'rapidjson' 'sdl2')
makedepends=('git' 'meson' 'ninja')
source=("git+$url")
sha1sums=('SKIP')
provides=(gpuvis)
conflicts=(gpuvis)

pkgver() {
  git -C gpuvis describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  arch-meson gpuvis build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 gpuvis/com.github.gpuvis.Gpuvis.desktop -t "$pkgdir/usr/share/applications/"
  install -Dm644 gpuvis/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
