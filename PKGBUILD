# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
pkgname_orig=Blockbench
pkgver=2.2.0
pkgrel=1
pkgdesc="A free, modern block model editor."
arch=('x86_64')
url="https://blockbench.net/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}_amd64.deb")
sha512sums=('a9a1c56742ae930d2bd3f6b91cf5451f37fc42467560a6a9dc3e006673d7085ccf0d63d4fb475e15f5532ad8536bcdf93e3f6de362f6a6a97475c501f46f522e')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving the files..."
  mv "${pkgdir}/opt/${pkgname_orig}" "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/blockbench.png" "${pkgdir}/usr/share/pixmaps/"
  rm -r "${pkgdir}/usr/share/icons"

  sed -i "s:/opt/${pkgname_orig}:/opt/${pkgname}:" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
