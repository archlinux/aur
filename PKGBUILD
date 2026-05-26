# Maintainer: Origuchi <tobiichioriguchi@gmail.com>
pkgname=ifreedomer-flix
pkgver=2.0.7.113
pkgrel=2
pkgdesc='Flix - 像聊天一样传文件. 跨平台文件传输工具，支持局域网内设备间快速分享文件。'
arch=('x86_64')
url='https://flix.center'
license=('LicenseRef-Flix-Proprietary')
depends=('libkeybinder3' 'libappindicator' 'libnotify')
conflicts=('flix-bin')
replaces=('flix-bin')
source=(
  "Flix-Linux-${pkgver}.deb::https://github.com/Tobiichi-Origuchi/flix-pkg/releases/download/v2.0.7.113/Flix-Linux-2.0.7.113.deb"
)
sha256sums=(
  'e6839485ea9646c058e3af0a59f1cd97af3fbf4910161a056af30f1614ec12db'
)

package() {
  bsdtar -xf data.tar.zst -C "$pkgdir"
  install -Dm644 "$pkgdir/opt/flix/data/flutter_assets/assets/data/flix_privacy.md" "$pkgdir/usr/share/licenses/${pkgname}/flix_privacy.md"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/flix/flix "$pkgdir/usr/bin/flix"
  sed -i \
    -e "s/Icon=com.ifreedomer.flix/Icon=flix/" \
    -e "s/Exec=flix %F/Exec=\/opt\/flix\/flix %F/" \
    "$pkgdir/usr/share/applications/flix-send.desktop"
  rm -rf \
    "$pkgdir/opt/flix/data/flutter_assets/assets/data/flix-firewall-gui.exe" \
    "$pkgdir/opt/flix/data/flutter_assets/assets/data/flix-firewall.exe" \
    "$pkgdir/usr/lib/" \
    "$pkgdir/usr/local/"
}
