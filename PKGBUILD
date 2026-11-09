# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=emergency-alerts
_app_id=io.github.leolost2605.emergency-alerts
pkgver=2.1.0
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
  'libportal-gtk4'
  'libshumate'
  'libsoup3'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7b10f360c826c4ae6a02e16c305d24518d229a491f671cfd2372c9c797674987')

build() {
  arch-meson "$pkgname-$pkgver" build -Dadwaita=true
  meson compile -C build
}

check() {
  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml"
  desktop-file-validate "build/data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/io.github.leolost2605.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
