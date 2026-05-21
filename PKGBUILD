# Maintainer: Origuchi <tobiichioriguchi@gmail.com>
pkgname=ifreedomer-flix
pkgver=2.0.6.111
pkgrel=1
pkgdesc='Flix - 像聊天一样传文件. 跨平台文件传输工具，支持局域网内设备间快速分享文件。'
arch=('x86_64')
url='https://flix.center'
license=('LicenseRef-Flix-Proprietary')
depends=('libkeybinder3' 'libappindicator' 'libnotify')
conflicts=('flix-bin')
replaces=('flix-bin')
source=(
  "${pkgname}-${pkgver}-${pkgrel}.deb::https://github.com/Tobiichi-Origuchi/flix-pkg/releases/download/v2.0.6.111/Flix-Linux-2.0.6.111.deb"
)
sha256sums=(
  '3a2159f27b9a7f6b760242ce7d912ec9443277c5b64e95594b177d325ea637a3'
)
noextract=(
  "${pkgname}-${pkgver}-${pkgrel}.deb"
)

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm644 "$pkgdir"/opt/flix/data/flutter_assets/assets/data/flix_privacy.md "$pkgdir"/usr/share/licenses/${pkgname}/flix_privacy.md
  ln -s "$pkgdir"/opt/flix/flix "$pkgdir"/usr/bin/flix
  sed -i     -e "s/Icon=com.ifreedomer.flix/Icon=flix/"     -e "s/Exec=flix %F/Exec=\/opt\/flix\/flix %F/"     "$pkgdir"/usr/share/applications/flix-send.desktop
  rm -rf     "$pkgdir"/opt/flix/data/flutter_assets/assets/data/flix-firewall-gui.exe     "$pkgdir"/opt/flix/data/flutter_assets/assets/data/flix-firewall.exe     "$pkgdir"/usr/lib/qt5/plugins/kf5/purpose/flixpurposeplugin.so     "$pkgdir"/usr/local/bin/flix
}
