# Maintainer: bitscoper <bitscoper@gmail.com>

pkgname=bitscoper-cyber-toolbox-bin
pkgdesc="A Flutter application consisting of TCP Port Scanner, Route Tracer, File Hash Calculator, String Encoder, Series URI Crawler, DNS Record Retriever, and WHOIS Retriever."
url="https://github.com/bitscoper/Bitscoper_Cyber_ToolBox/"
license=("GPL3")
provides=("bitscoper-cyber-toolbox-bin")
makedepends=("jq" "unzip")
depends=('gtk3')
# checkdepends=('')
# optdepends=('')
options=(!debug)
# install="${pkgname%}.install"
source=('https://github.com/bitscoper/Bitscoper_Cyber_ToolBox/releases/latest/download/Linux_x64_Executable.zip')
sha256sums=('SKIP')
arch=('x86_64')
pkgver=8.0.4
pkgrel=1

package() {
  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/"
  install -Dm755 "$srcdir/Linux_x64_Executable/Bitscoper_Cyber_ToolBox" "$pkgdir/opt/Bitscoper_Cyber_ToolBox/"

  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/lib/"
  cp -r "$srcdir/Linux_x64_Executable/lib/"* "$pkgdir/opt/Bitscoper_Cyber_ToolBox/lib/"

  install -dm755 "$pkgdir/opt/Bitscoper_Cyber_ToolBox/data/"
  cp -r "$srcdir/Linux_x64_Executable/data/"* "$pkgdir/opt/Bitscoper_Cyber_ToolBox/data/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/Bitscoper_Cyber_ToolBox/Bitscoper_Cyber_ToolBox" "$pkgdir/usr/bin/Bitscoper_Cyber_ToolBox"

  for size in 48 72 96 128 192 512; do
    wget -O "$srcdir/maskable_icon_x${size}.png" "https://raw.githubusercontent.com/bitscoper/Bitscoper_Cyber_ToolBox/main/assets/icon/maskable_icon_x${size}.png"
    install -Dm644 "$srcdir/maskable_icon_x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/Bitscoper_Cyber_ToolBox.png"
  done

  wget -O "$srcdir/Bitscoper_Cyber_ToolBox.desktop" "https://raw.githubusercontent.com/bitscoper/Bitscoper_Cyber_ToolBox/main/Linux_Extras/Bitscoper_Cyber_ToolBox.AppDir/Bitscoper_Cyber_ToolBox.desktop"
  install -Dm644 "$srcdir/Bitscoper_Cyber_ToolBox.desktop" "$pkgdir/usr/share/applications/Bitscoper_Cyber_ToolBox.desktop"
}
