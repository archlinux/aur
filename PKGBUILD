# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bouncer
pkgver=48.2.0
pkgrel=1
pkgdesc="An application to help you choose the correct firewall zone for wireless connections."
arch=('any')
url="https://github.com/justinrdonnelly/bouncer"
license=('MPL-2.0')
depends=(
  'firewalld'
  'gjs'
  'libadwaita'
  'libportal'
  'networkmanager'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9f3c21f568ebc329086e2116d771ecc55c7841294ff8d174e8c8be53520af317')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.justinrdonnelly.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
