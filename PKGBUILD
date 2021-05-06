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
sha512sums=('6b6b444a1d661372952a9259c46707a8176718c741ead1eb7a218457b89e7d67f3fcfc137116bded4d2d012aab319766c9be0f4bef87a86cb51633b9494c5aed')

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
