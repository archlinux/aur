# Maintainer: Origuchi <tobiichioriguchi@gmail.com>
pkgname=ifreedomer-flix
pkgver=2.2.1.121
pkgrel=1
pkgdesc='Flix - 像聊天一样传文件. 跨平台文件传输工具，支持局域网内设备间快速分享文件。'
arch=('x86_64')
url='https://flix.center'
license=('LicenseRef-Flix-Proprietary')
depends=('libkeybinder3' 'libappindicator' 'libnotify')
conflicts=('flix-bin')
replaces=('flix-bin')
source=(
  "Flix-Linux-${pkgver}.deb::https://github.com/Tobiichi-Origuchi/flix-pkg/releases/download/v2.2.1.121/Flix-Linux-2.2.1.121.deb"
)
sha256sums=(
  '0357d097825bbd1c922c36bfd426d13ea79fa811df3e3fbeeb3310bc714b46f5'
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
