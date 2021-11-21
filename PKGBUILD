# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=caj2pdf-qt
pkgver=0.1.1
pkgrel=2
pkgdesc='CAJ 转 PDF 转换器（GUI 版本）'
arch=('x86_64')
url='https://caj2pdf-qt.sainnhe.dev'
license=('GPL')
depends=('qt6-base' 'qt6-5compat')
makedepends=('git' 'python' 'cmake')
provides=('caj2pdf-qt')
conflicts=('caj2pdf-qt')
source=("${pkgname}::git+https://github.com/sainnhe/caj2pdf-qt.git#tag=v0.1.1"
        'dev.sainnhe.caj2pdf-qt.desktop')
md5sums=('SKIP'
         'c6a174615e8edde98c46c671a16babea')

build() {
  cd "${srcdir}/${pkgname}"
  git clean -dfx -- .
  ./build.py
}

package() {
  install -Dm 644 "${srcdir}/dev.sainnhe.caj2pdf-qt.desktop" "${pkgdir}/usr/share/applications/dev.sainnhe.caj2pdf-qt.desktop"
  install -Dm 644 "${srcdir}/${pkgname}/icons/convert.png" "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm 755 "${srcdir}/${pkgname}/build/caj2pdf" "${pkgdir}/usr/share/${pkgname}/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}/build/external/caj2pdf" "${pkgdir}/usr/share/${pkgname}/external/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}/build/external/mutool" "${pkgdir}/usr/share/${pkgname}/external/mutool"
}
