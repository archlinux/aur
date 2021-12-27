# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=mpd-pulse
pkgver=0.3.0
pkgrel=1
pkgdesc="Allows MPD output to go to a different Pulse Audio sink than your default."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/matt-h/mpd-pulse"
license=('MIT')
depends=('libpulse' 'mpc')
makedepends=('cargo')
backup=('etc/mpd-pulse.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matt-h/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('960c7241118890b430335a98bb25e4e0775d81d40a942cdb68c530998e02901f')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  install -Dm 755 "$srcdir/${pkgname}-${pkgver}/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/system/mpd-pulse.service" "$pkgdir/usr/lib/systemd/user/${pkgname}.service"
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/config/mpd-pulse.conf" "$pkgdir/etc/mpd-pulse.conf"
}
