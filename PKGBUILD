# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mendingwall
pkgver=0.3.8
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
sha256sums=('e93a5d1a4e6f266b7207d9363ba7985dbc5a14fcc52749bd40c27fe01cfeb876')

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
