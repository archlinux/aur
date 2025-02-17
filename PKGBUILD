# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Paragoumba <paragoumba@protonmail.com>
# Contributor: Amos Wenger <amos@itch.io>

pkgname=itch-setup-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="Installer for the itch.io desktop app"
arch=(x86_64)
url="https://itch.io/"
license=(MIT)
depends=(gtk3)
_itchver=25.5.1
source=("itch-${_itchver}.tar.gz::https://github.com/itchio/itch/archive/refs/tags/v${_itchver}.tar.gz"
        "itch-setup-LICENSE::https://raw.githubusercontent.com/itchio/itch-setup/master/LICENSE"
        'itch.desktop'
        'itch.sh')
provides=(itch-setup)
conflicts=(itch-setup itch)
source_x86_64=("itch-setup-$(date +%F-%H)-amd64::https://itch.io/app/download?platform=linux")
sha256sums=('0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            'd50905ab2e78d6ed3773959d6fb3c1c2fee724cf497f1c441cacb3765eac30ff'
            '57e1c8ad285b89f3380cd028aa51e8083a8e4327cc5763d396caf607e905efcf'
            '985cf842686598dd7e4e153f6fd7c9ee901fd200403893235e2974b108653bcf')
sha256sums_x86_64=('79b88978ff6199ab9f1b1ed3b2108d1245d680e62c5751bac4879cdd9b102b9f')

package() {
  install -Dm755 itch-setup-*-amd64 "${pkgdir}/usr/bin/itch-setup"
  install -Dm755 itch.sh "${pkgdir}/usr/bin/itch"
  install -Dm644 itch.desktop -t "${pkgdir}/usr/share/applications/"
  install -Dm644 itch-setup-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "itch-${_itchver}"
  for icon in release/images/itch-icons/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done
}
