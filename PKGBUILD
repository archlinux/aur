# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mendingwall
pkgver=0.3.7
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
sha256sums=('4c2b3c9dace16994d43da46ac741acead2f3a4d750bc50d16687285a500c4906')

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
