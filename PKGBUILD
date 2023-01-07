# Maintainer: Puqns67 <me@puqns67.icu>

_pkgbase='smiley-sans'
pkgbase="${_pkgbase}-bin"
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=1.1.1
pkgrel=1
pkgdesc='一款在人文观感和几何特征中寻找平衡的中文黑体'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')

source=("${_pkgbase}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgbase}-v${pkgver}.zip"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE")

sha512sums=('61bcc6d8957a6a7426c3a76968bea4fb4fb8a1da4dda4036c3c9533f8cc8120bfae879b51e73dc3b0399558b03709df5781fbac94deb16ed7d6a4a3e13dd837c'
            'f5d63f0427d68c9414779119477f1c0ca0c51d6fc7e349934a32d85b0aa15d63a1f56a313f9b41daec25ae63e482ad3f73fc45414b21d40e0e93addb11f47db6')

_package() {
  pkgdesc+=" (${pkgname%-${pkgbase}})"
  provides=(${pkgname%-bin})
  conflicts=(${pkgname%-bin})

  install -Dm644 -t "${pkgdir}/usr/share/fonts/${_pkgbase}" ${srcdir}/*.${pkgname%-${pkgbase}}
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
