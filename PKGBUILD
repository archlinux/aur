# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=csvtk
pkgver=0.36.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url="https://github.com/shenwei356/csvtk"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shenwei356/csvtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0acea7e49c8af12ed76b11ec562ffc05a2fff28cb3c4e7b032e9271f13599ec8')

build(){
  cd "${pkgname}-${pkgver}"/${pkgname}
  go build  -tags netgo -ldflags '-w -s' -asmflags '-trimpath'
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/${pkgname}
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rf doc/docs/* "${pkgdir}/usr/share/doc/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  chmod 644 testdata/empty.csv.xlsx
  cp -rf testdata "${pkgdir}/usr/share/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"/index.md
  cd "${pkgdir}/usr/share/doc/${pkgname}"/testdata
  rm -rf figures
  ln -s ../../../csvtk/testdata/figures ./figures
}
