# Maintainer: Mateusz Cegiełka <mateusz@cegla.net>

pkgname=vaxtify
pkgver=0.1.5
pkgrel=1
pkgdesc="Distraction blocker for the stubborn"
url="https://github.com/pustaczek/vaxtify"
arch=('x86_64')
license=('MPL2')
depends=('dbus' 'gcc-libs')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2b02d98531eb7e261da24ba66ec8ee5ec82a5bc6f1cd8eb7583c54a8a47bcc5e')

build() {
  cd "${srcdir}/vaxtify-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/vaxtify-${pkgver}"
  install -Dm755 "target/release/vaxtify" "${pkgdir}/usr/bin/vaxtify"
  install -Dm644 "misc/systemd-unit/vaxtify.service" "${pkgdir}/etc/systemd/user/vaxtify.service"
  install -Dm644 "misc/dbus-service/dev.pustaczek.Vaxtify.service" "${pkgdir}/usr/share/dbus-1/services/dev.pustaczek.Vaxtify.service"
  install -Dm644 "misc/webextension-manifest/vaxtify.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/vaxtify.json"
}
