# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mendingwall
pkgver=0.3.10
pkgrel=1
pkgdesc="Fix issues when hopping between multiple desktop environments"
arch=('x86_64' 'aarch64')
url="https://indii.org/software/mendingwall"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lawmurray/mendingwall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c940e3bf74d3361ae882d59ca22e09c1b10e11ce9d844fff5de4d207c0de04f4')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
