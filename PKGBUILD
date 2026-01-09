# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emergency-alerts
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple app that sends you emergency alerts about your locations"
arch=('x86_64')
url="https://github.com/leolost2605/emergency-alerts"
license=('GPL-3.0-or-later')
depends=(
  'granite7'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libportal'
  'libshumate'
  'libsoup3'
)
makedepends=(
  'meson'
  'vala'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('45fe052d1aed883665b916f354e10555138288d8aac9865c482e99740490db54')

build() {
  arch-meson "$pkgname-$pkgver" build -Dadwaita=true
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.leolost2605.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
