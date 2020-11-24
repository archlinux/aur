# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=mpd-pulse
pkgver=0.1.0
pkgrel=1
pkgdesc="Open-source Modbus TCP to Modbus RTU (RS-232/485) gateway."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/matt-h/mpd-pulse"
license=('MIT')
depends=('libpulse' 'mpc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matt-h/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('80a37bf077e79df8476e9c4fa8499694ea78060f6f7630ffa0687e9364bcd1d7')

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
}
