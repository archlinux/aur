# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Atakku <atakkudev@gmail.com>

pkgname=blockbench-bin
_pkgname=blockbench
provides=(blockbench)
conflicts=(blockbench)
pkgname_orig=Blockbench
pkgver=4.6.3
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64')
url="https://blockbench.net/"
license=('GPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
makedepends=('gzip')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('a4d71e280a54ed98104276ac8efe60f976d02cebbbf0943476c18f3142549503e6b1f17b9b5f086d1be7a856efbaeff74cc1a40b42a566e82a6a036ae22f5160')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"

  msg2 "Moving the files..."
  mv "${pkgdir}/opt/${pkgname_orig}" "${pkgdir}/opt/${_pkgname}"
  gzip -d "${pkgdir}/usr/share/doc/${_pkgname}/changelog.gz"

  sed -i "s:/opt/${pkgname_orig}:/opt/${_pkgname}:" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
