# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
pkgname_orig=Blockbench
pkgver=3.1.0
pkgrel=1
pkgdesc="A free, modern block model editor."
arch=('x86_64')
url="https://blockbench.net/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('f817aded4c910cce9be1209707f3f3802289c2b1c638c728d7600f913035b820f0bd60a7e01ecc7796bccb9b715eb238c97ea19b147f60852b501a5a6ada432a')

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
