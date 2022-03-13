# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Paragoumba <paragoumba@protonmail.com>
# Contributor: Amos Wenger <amos@itch.io>

pkgname=itch-setup-bin
pkgver=1.26.0
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
            '593d3d46e379fc634ace8a97bb738a9bda1b29ea78d99e5542be47acb2865731'
            '985cf842686598dd7e4e153f6fd7c9ee901fd200403893235e2974b108653bcf')
sha256sums_x86_64=('c7a13db7234ca908bcfb60ed5369b5c02b0a795e5e5490f68eeacb5a637a2162')

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
