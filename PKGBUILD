# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bouncer
pkgver=49.0.0
pkgrel=2
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
sha256sums=('de6c995d491b9a9377e00ced63088fa4cd211857fa71f88a4521f618125fd84d')

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
