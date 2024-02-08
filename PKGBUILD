# Maintainer: Puqns67 <me@puqns67.icu>

_pkgbase='smiley-sans'
pkgbase="${_pkgbase}-bin"
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=2.0.1
pkgrel=1
pkgdesc='一款在人文观感和几何特征中寻找平衡的中文黑体'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL-1.1-RFN')
arch=('any')

source=("${_pkgbase}-${pkgver}.zip"::"${url}/releases/download/v${pkgver}/${_pkgbase}-v${pkgver}.zip"
        "LICENSE"::"${url}/raw/v${pkgver}/LICENSE")

b2sums=('8ab08c55f215b700803dd3ad606a7ed9ad7807422eab2ffd669e95893a75399ce401586da56b84bce44c739be2c547ace9fd17707703957f7f2f6f17e75b8f26'
        'a0bf4661bbbfe17f20112612a25abdea8db2de6f034f4532c8090ede7a862932708dd6eb3342316e4c0461d131c48c65dce7c2c7854e871ef9824b18617c056e')

_package() {
  pkgdesc+=" (${pkgname%-${pkgbase}})"
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  install -Dm644 -t "${pkgdir}/usr/share/fonts/${_pkgbase}" ${srcdir}/*.${pkgname%-${pkgbase}}
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
