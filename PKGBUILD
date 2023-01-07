# Maintainer: Puqns67 <me@puqns67.icu>

_pkgbase='smiley-sans'
pkgbase="${_pkgbase}-bin"
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=1.1.0
pkgrel=1
pkgdesc='得意黑 Smiley Sans'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')

source=("${_pkgbase}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgbase}-v${pkgver}.zip"
        "LICENSE::${url}/raw/v${pkgver}/LICENSE")

sha512sums=('4c1fac35d384f8169f3a810bf2df4e69577029c240eab1046f1daa8b95a761f809ba9e7d83dd129f5007bc86c5ca4e8894b969ac2e9e773e73aa751f39b5aa4a'
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

# vim:set ts=2 sw=2 et: