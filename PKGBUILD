# Maintainer: mrAppleXZ <mr.applexz@gmail.com> 

pkgname=blockbench
pkgname_orig=Blockbench
pkgver=3.4.1
pkgrel=1
pkgdesc="A free, modern block model editor."
arch=('x86_64')
url="https://blockbench.net/"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator' 'libxtst' 'nss' 'libxss')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('85f6820f8a7abbabfe569094a89ba8cd4d65f7eb725492c5308de4074fccd087564b7845889a71fb1b62aea6fc88af4b8f5cab6ede04a4336500e8271c20e1c4')

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
