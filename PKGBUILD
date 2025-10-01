# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bouncer
pkgver=49.1.0
pkgrel=1
pkgdesc="An application to help you choose the correct firewall zone for wireless connections."
arch=('any')
url="https://github.com/justinrdonnelly/bouncer"
license=('MPL-2.0')
depends=(
  'firewalld'
  'gjs'
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'networkmanager'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d01e2e682415ab9f7e1397af1f55b7d6cd595e42d23cf40ff8497814b1e4ed42')

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
