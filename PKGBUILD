pkgname=garmin-tracker-rs
pkgver=1.8.2
pkgrel=1
pkgdesc='Sync your devices and track your strength training'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-2')
makedepends=(
  'rust'
)
source=(
  "git+$url.git#tag=$pkgver"
)
sha256sums=(
  'SKIP'
)

depends=('webkit2gtk-4.1' 'zlib-ng-compat')
makedepends=(
  'rust'
  'mold'
  'npm'
  'pnpm'
  'python-toml'
  'python-yaml'
)

install=${pkgname}.install

build() {
  cd "$srcdir/${pkgname}"
  RUSTFLAGS="" make build
}

package() {
  cd "$srcdir/${pkgname}/src-tauri/target/release/bundle/deb"
  cp -a Garmin\ Tracker_${pkgver}_*/data/* "${pkgdir}"

  cd "$srcdir/${pkgname}/resources"
  install -Dm644 99-garmin-tracker-rs.rules "$pkgdir/etc/udev/rules.d/99-garmin-tracker-rs.rules"
}