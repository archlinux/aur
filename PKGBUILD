# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Atakku <atakkudev@gmail.com>

pkgname=blockbench-bin
_pkgname=blockbench
provides=(blockbench)
conflicts=(blockbench)
pkgname_orig=Blockbench
pkgver=4.7.1
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64')
url="https://blockbench.net/"
license=('GPL3')
depends=('gtk3' 'nss' 'giblib' 'at-spi2-core' 'alsa-lib')
makedepends=('gzip')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('4987144d0d79d7a4b27043e38a8db4ae5fe1755b193302e0e309ff4852870feec53b6b8bd76c2f0b0a657db15f02ddb7ea0fc4c9dbc91ab66e13cc23c71fe580')

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
