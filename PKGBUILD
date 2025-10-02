# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mendingwall
pkgver=0.3.6
pkgrel=1
pkgdesc="Fix issues when hopping between multiple desktop environments"
arch=('x86_64')
url="https://mendingwall.indii.org"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lawmurray/mendingwall/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af16411365061d1983cff5db6fbaad565b8df948417f78ed168d45a5537b6e0e')

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
