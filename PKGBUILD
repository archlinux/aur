# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mendingwall
pkgver=0.3.9
pkgrel=1
pkgdesc="Fix issues when hopping between multiple desktop environments"
arch=('x86_64' 'aarch64')
url="https://mendingwall.indii.org"
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
sha256sums=('8692a1f6e2a192ae17e6efa6b0db15b1778cf4e648c2216e7376c42b0e7c84fe')

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
