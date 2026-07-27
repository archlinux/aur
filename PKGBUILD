# Maintainer: LegionWorks <aur@legionworks.dev>

pkgname=dormant-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="OLED screen blanking daemon that responds to presence sensors"
arch=('x86_64')
url="https://github.com/legion-works/dormant"
license=('MIT' 'Apache-2.0')
provides=('dormant')
conflicts=('dormant')

source=(
  "dormantd-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/legion-works/dormant/releases/download/v${pkgver}/dormantd-x86_64-unknown-linux-gnu.tar.xz"
  "dormantctl-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/legion-works/dormant/releases/download/v${pkgver}/dormantctl-x86_64-unknown-linux-gnu.tar.xz"
  "dormant-tray-${pkgver}-x86_64-unknown-linux-gnu.tar.xz::https://github.com/legion-works/dormant/releases/download/v${pkgver}/dormant-tray-x86_64-unknown-linux-gnu.tar.xz"
  "dormant.service::https://raw.githubusercontent.com/legion-works/dormant/v${pkgver}/crates/dormantd/systemd/dormant.service"
  "dormant-tray.service::https://raw.githubusercontent.com/legion-works/dormant/v${pkgver}/crates/dormant-tray/systemd/dormant-tray.service"
)

sha256sums=('34f3c9ccdc7cb6114ae01022391fbafc319200ce2bc62beee1f65579cf41f715'
            '8e52c60b3a876c1a79b6d1ca7a2dc52f914e86b49417175042e82169e8812863'
            '9cc2a27b4b9ecbc8d965d030f2765014bfaaf3eb9e3f0785383b328a7b25e9a4'
            'b14a73e32f3a3337e27e9ad1690ee955e29cd0d9453410bd4c6e4e9064f2af74'
            'deaf7ce6d00e1c3be46038c1c17b914f457dc7afb82c9282d1d8efa1305c9baa')

package() {
  # Binaries
  install -Dm755 dormantd-x86_64-unknown-linux-gnu/dormantd "${pkgdir}/usr/bin/dormantd"
  install -Dm755 dormantctl-x86_64-unknown-linux-gnu/dormantctl "${pkgdir}/usr/bin/dormantctl"
  install -Dm755 dormant-tray-x86_64-unknown-linux-gnu/dormant-tray "${pkgdir}/usr/bin/dormant-tray"

  # Systemd user units — sourced from raw.githubusercontent.com because the
  # v0.3.1 tarballs predate systemd-unit packaging (added in a later commit).
  install -Dm644 dormant.service "${pkgdir}/usr/lib/systemd/user/dormant.service"
  install -Dm644 dormant-tray.service "${pkgdir}/usr/lib/systemd/user/dormant-tray.service"

  # Licenses (dual MIT / Apache-2.0)
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  # Documentation
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
