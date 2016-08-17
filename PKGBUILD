# Maintainer: Gore Liu <goreliu@126.com>

pkgname=cbwin
pkgver=0.9
pkgrel=1
pkgdesc='Launch Windows programs from "Bash on Ubuntu on Windows" (WSL)'
arch=('i686' 'x86_64')
url='https://github.com/xilun/cbwin'
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/xilun/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('a5a20c4d60f2c0be30ad1816812c9b37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd caller && ./build.sh
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm 755 "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -m755 caller/wrun "${pkgdir}/usr/bin/wrun"

  cd "${pkgdir}/usr/bin"
  ln wrun wcmd
  ln wrun wstart
}
