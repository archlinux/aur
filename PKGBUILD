# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='smiley-sans'
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=2.0.1
pkgrel=1
pkgdesc='一款在人文观感和几何特征中寻找平衡的中文黑体'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL-1.1-RFN')
arch=('any')
makedepends=('python-brotli' 'python-fontmake' 'python-fonttools')

source=("${pkgbase}-${pkgver}.tar.gz"::"${url}/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('3f1e1d7316f2e4ffc51cde15312149c080337e88c7931438728d18e80411027dc5af2b9768b48a47c6106e2aeef6b59c74d99f6b3279a65ade0a5fa080d6adbb')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  sh "${srcdir}/${pkgbase}-${pkgver}/build.sh"
}

_package() {
  pkgdesc+=" (${pkgname%-${pkgbase}})"
  provides=("${pkgname}")
  conflicts=("${pkgname}")

  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" ${srcdir}/${pkgbase}-${pkgver}/build/*.${pkgname%-${pkgbase}}
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
