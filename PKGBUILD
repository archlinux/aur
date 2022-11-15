# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='smiley-sans'
pkgname=("otf-${pkgbase}" "ttf-${pkgbase}" "woff2-${pkgbase}")
pkgver=1.0.0
pkgrel=1
pkgdesc='得意黑 Smiley Sans'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')
makedepends=('python-brotli' 'python-fontmake' 'python-fonttools')

source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('c5c22eaa3fc3d0f8e15752a63acc8e76ffee7615064cfc332804316aabb45bd28f7e8a72b0d6ae9291cbb91d0d631c8cc58da72ed41ecfa8c7159aaaea66dba3')

build() {
  rm -rf "${srcdir}/${pkgbase}-${pkgver}/build/"
  cd "${srcdir}/${pkgbase}-${pkgver}/"
  sh "${srcdir}/${pkgbase}-${pkgver}/build.sh"
}

package_otf-smiley-sans() {
  # tags
  pkgdesc+=" (otf)"
  conflicts=('otf-smiley-sans')

  # font files
  cd "${srcdir}/${pkgbase}-${pkgver}/build/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" *.otf

  # license
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_ttf-smiley-sans() {
  pkgdesc+=" (ttf)"
  conflicts=('ttf-smiley-sans')

  cd "${srcdir}/${pkgbase}-${pkgver}/build/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" *.ttf

  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_woff2-smiley-sans() {
  pkgdesc+=" (woff2)"
  conflicts=('woff2-smiley-sans')

  cd "${srcdir}/${pkgbase}-${pkgver}/build/"
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" *.woff2

  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et: