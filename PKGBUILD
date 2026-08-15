# Maintainer: LegionWorks <aur@legionworks.dev>

pkgname=dormant-bin
pkgver=0.12.4
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
  "app-dormant.service::https://raw.githubusercontent.com/legion-works/dormant/v${pkgver}/crates/dormantd/systemd/app-dormant.service"
  "dormant-tray.service::https://raw.githubusercontent.com/legion-works/dormant/v${pkgver}/crates/dormant-tray/systemd/dormant-tray.service"
)

sha256sums=('03803ffb68b922811aac3ccfc4abbe589cdf0f93ea453689b74ff0be5694742b'
            '071e3ffb2b6eb2fdac7eb35524757a99342f1943be5e88f835819ff895bf9fa3'
            'b428199c51ae8c95fd793d7452174628c485a4d604526cdf6ef34c04bf3a428b'
            'b14a73e32f3a3337e27e9ad1690ee955e29cd0d9453410bd4c6e4e9064f2af74'
            '0f82ccb8d41677116bc236966b6c7d817392bbc4e9d1cb07bb43526c5b2b1648')

package() {
  # Binaries
  install -Dm755 dormantd-x86_64-unknown-linux-gnu/dormantd "${pkgdir}/usr/bin/dormantd"
  install -Dm755 dormantctl-x86_64-unknown-linux-gnu/dormantctl "${pkgdir}/usr/bin/dormantctl"
  install -Dm755 dormant-tray-x86_64-unknown-linux-gnu/dormant-tray "${pkgdir}/usr/bin/dormant-tray"

  # Systemd user units — sourced from raw.githubusercontent.com because the
  # v0.3.1 tarballs predate systemd-unit packaging (added in a later commit).
  install -Dm644 app-dormant.service "${pkgdir}/usr/lib/systemd/user/app-dormant.service"
  install -Dm644 dormant-tray.service "${pkgdir}/usr/lib/systemd/user/dormant-tray.service"

  # Portal application identity metadata.
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/dormant.desktop \
    "${pkgdir}/usr/share/applications/dormant.desktop"

  # Licenses (dual MIT / Apache-2.0)
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  # Documentation
  install -Dm644 dormantd-x86_64-unknown-linux-gnu/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
