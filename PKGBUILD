# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=csvtk
pkgver=0.24.0
pkgrel=1
pkgdesc="A cross-platform, efficient and practical CSV/TSV toolkit in Golang"
arch=('x86_64')
url="https://github.com/shenwei356/csvtk"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shenwei356/csvtk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d944e55d9555733990783bbe45200da5eaef47a13d4eac242ef084d9384d54f8')

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
  cp -rf testdata "${pkgdir}/usr/share/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"/index.md
  cd "${pkgdir}/usr/share/doc/${pkgname}"/testdata
  rm -rf figures
  ln -s ../../../csvtk/testdata/figures ./figures
}
