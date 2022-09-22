# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# contrbutor: Clint Valentine <valentine.clint@gmail.com>

_pkgname=csvtk
pkgname=${_pkgname}-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url=http://bioinf.shenwei.me/csvtk
license=('MIT')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(
  "${_pkgname}"-"${pkgver}"::https://github.com/shenwei356/"${_pkgname}"/archive/v"${pkgver}".tar.gz
  "${_pkgname}"-"${pkgver}"-binary::https://github.com/shenwei356/"${_pkgname}"/releases/download/v"${pkgver}"/"${_pkgname}"_linux_amd64.tar.gz
)
sha256sums=('47d244068274ad5070ef50cafee243d1035c51692b025bf074d0b7be3f8a7d1c'
            'f7b173cb40ca84cad834ccb65721b6ef96849f07718ce854c47ca65a04710d9e')

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
  install -Dm755 "${_pkgname}"-"${pkgver}"-binary "${pkgdir}"/usr/bin/"${_pkgname}"
}
