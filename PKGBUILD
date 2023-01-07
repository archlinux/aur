# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='smiley-sans'
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=1.1.0
pkgrel=1
pkgdesc='得意黑 Smiley Sans'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')
makedepends=('python-brotli' 'python-fontmake' 'python-fonttools')

source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('7cd2f2c231d756e3a97a94c6e548499bad1a004d2d002799ac22c826dd35c8fe8320b983f447f7a2719671c63c3846462e9fa91509029f2ab858c5b754d1598c')

build() {
  rm -rf "${srcdir}/${pkgbase}-${pkgver}/build/"
  cd "${srcdir}/${pkgbase}-${pkgver}/"
  sh "${srcdir}/${pkgbase}-${pkgver}/build.sh"
}

_package() {
  pkgdesc+=" (${pkgname%-${pkgbase}})"
  provides=(${pkgname})
  conflicts=(${pkgname})

  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" ${srcdir}/${pkgbase}-${pkgver}/build/*.${pkgname%-${pkgbase}}
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done

# vim:set ts=2 sw=2 et: