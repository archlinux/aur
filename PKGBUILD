# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=caj2pdf-qt
pkgver=0.1.3
pkgrel=1
pkgdesc='CAJ 转 PDF 转换器（GUI 版本）'
arch=('x86_64')
url='https://caj2pdf-qt.sainnhe.dev'
license=('GPL')
depends=('qt6-base' 'qt6-5compat')
makedepends=('git' 'python' 'cmake')
provides=('caj2pdf-qt')
conflicts=('caj2pdf-qt')
source=("${pkgname}::git+https://github.com/sainnhe/caj2pdf-qt.git#tag=v${pkgver}"
        'dev.sainnhe.caj2pdf-qt.desktop')
md5sums=('SKIP'
         '3068f1cbf4fb1d8c04a9f8afb3fb7d54')

build() {
  cd "${srcdir}/${pkgname}"
  ./build.py
}

package() {
  install -Dm 644 "${srcdir}/dev.sainnhe.caj2pdf-qt.desktop" "${pkgdir}/usr/share/applications/dev.sainnhe.caj2pdf-qt.desktop"
  install -Dm 644 "${srcdir}/${pkgname}/icons/convert.png" "${pkgdir}/usr/share/${pkgname}/icon.png"
  install -Dm 755 "${srcdir}/${pkgname}/build/caj2pdf" "${pkgdir}/usr/share/${pkgname}/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}/build/external/caj2pdf" "${pkgdir}/usr/share/${pkgname}/external/caj2pdf"
  install -Dm 755 "${srcdir}/${pkgname}/build/external/mutool" "${pkgdir}/usr/share/${pkgname}/external/mutool"
  install -Dm 644 "${srcdir}/${pkgname}/build/external/libjbigdec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbigdec.so"
  install -Dm 644 "${srcdir}/${pkgname}/build/external/libjbig2codec.so" "${pkgdir}/usr/share/${pkgname}/external/libjbig2codec.so"
  chmod a+w "${pkgdir}/usr/share/${pkgname}/external"
}
