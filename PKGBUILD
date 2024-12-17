# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# contrbutor: Clint Valentine <valentine.clint@gmail.com>

_pkgname=csvtk
pkgname=${_pkgname}-bin
pkgver=0.32.0
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
sha256sums=('eb54e0a14207b6c58cefd9bc6747453e758b2bdbf8e111df9873628b6fa23a01'
            'cabfe4a3c20693c7ee2d0a49b305a5342039d174a2949a8f798c49cf8f086e76')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
  cp -rf doc/docs/* "${pkgdir}/usr/share/doc/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  chmod 644 testdata/empty.csv.xlsx
  cp -rf testdata "${pkgdir}/usr/share/${_pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}"/index.md
  cd "${pkgdir}/usr/share/doc/${_pkgname}"/testdata
  rm -rf figures
  ln -s ../../../csvtk/testdata/figures ./figures

  cd "${srcdir}/"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
}
