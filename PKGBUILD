# Maintainer: 
# Contributor: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=kitch-setup-bin
pkgver=1.26.0
pkgrel=1
pkgdesc="Beta builds of itch.io desktop app"
arch=(x86_64)
url="https://itch.io/"
license=(MIT)
depends=(gtk3)
provides=(kitch-setup)
conflicts=(kitch-setup kitch)
_itchver=25.5.1
source=("itch-${_itchver}.tar.gz::https://github.com/itchio/itch/archive/refs/tags/v${_itchver}.tar.gz"
        'kitch.desktop'
        'kitch.sh')
source_x86_64=("kitch-setup-${pkgver}-amd64::https://broth.itch.ovh/kitch-setup/linux-amd64/${pkgver}/archive/default")
sha256sums=('0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            'cdce23baa0f8f22abac8d8c1d23680101710701dfd07ef834b5bdfda1694f4d7'
            'c6c9e7eca91c2ba1e1eb80af90c05e889bdf8f2bbcbe77d8698772385888e870')
sha256sums_x86_64=('01f642b61261c8a60cb1c42a1eda3fd1ac5ab76f13f1e5ef8e49399825e6ea00')

package() {
  install -Dm755 kitch-setup -t "${pkgdir}/usr/bin/"
  install -Dm755 kitch.sh "${pkgdir}/usr/bin/kitch"
  install -Dm644 kitch.desktop -t "${pkgdir}/usr/share/applications/"

  cd "itch-${_itchver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for icon in release/images/kitch-icons/icon*.png
  do
    iconsize="${icon#release/images/kitch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/kitch.png"
  done
}
