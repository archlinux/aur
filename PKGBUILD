# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
pkgname_orig=Blockbench
pkgver=3.8.4
pkgrel=1
pkgdesc="A free, modern block model editor."
arch=('x86_64')
url="https://blockbench.net/"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('4d24ed810a7937eac7bde54951b40997b8c564a3c74c4a2d6a04b1194dd5c2b5f467f40eeda066deec5bbca1e5ce335fd801c7f2d84c0be4f8d955678f541dfa')

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
