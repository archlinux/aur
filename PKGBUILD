# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# contrbutor: Clint Valentine <valentine.clint@gmail.com>

_pkgname=csvtk
pkgname=${_pkgname}-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url=https://bioinf.shenwei.me/csvtk/
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(
  "${_pkgname}"-"${pkgver}"::https://github.com/shenwei356/"${_pkgname}"/archive/v"${pkgver}".tar.gz
  "${_pkgname}"-"${pkgver}"-binary.tar.gz::https://github.com/shenwei356/"${_pkgname}"/releases/download/v"${pkgver}"/"${_pkgname}"_linux_amd64.tar.gz
)
sha256sums=('849b8c69fdd886bda077eb76b01de27701e06dff6496695ce60a18fdd6a07ff0'
            'd8b276cf2ddd46e39537b3d9c9223c95c90cc2b39c28a1254ebfa37011a52138')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -rf doc/docs/* "${pkgdir}/usr/share/doc/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -rf testdata "${pkgdir}/usr/share/${_pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}"/index.md
  cd "${pkgdir}/usr/share/doc/${_pkgname}"/testdata
  rm -rf figures
  ln -s ../../../csvtk/testdata/figures ./figures

  cd "${srcdir}/"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}
