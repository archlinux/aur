# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Atakku <atakkudev@gmail.com>

pkgname=blockbench-bin
_pkgname=blockbench
provides=(blockbench)
conflicts=(blockbench)
pkgname_orig=Blockbench
pkgver=4.8.0
pkgrel=1
pkgdesc="A low-poly 3D model editor"
arch=('x86_64')
url="https://blockbench.net/"
license=('GPL3')
depends=('gtk3' 'nss' 'giblib' 'at-spi2-core' 'alsa-lib')
makedepends=('gzip')
source=("https://github.com/JannisX11/blockbench/releases/download/v${pkgver}/Blockbench_${pkgver}.deb")
sha512sums=('a9180257e26503584fafd15030481a4f4ed4956025c29777688c5d9d0e99deb0ce40241eec5ce0f82a64d6d262d6dc7c69b1843340e36efc8d28f7e31ab7446c')

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
