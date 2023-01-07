# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='smiley-sans'
pkgname=({otf,ttf,woff2}-${pkgbase})
pkgver=1.1.1
pkgrel=1
pkgdesc='一款在人文观感和几何特征中寻找平衡的中文黑体'
url='https://github.com/atelier-anchor/smiley-sans'
license=('OFL')
arch=('any')
makedepends=('python-brotli' 'python-fontmake' 'python-fonttools')

source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha512sums=('abeea79a7938af0ffe673aae74100129a3d99dd377ebab92a3426bae029c085c5f3ae3978880f0311829c80a13faa264bf061f539aafc672a93f53917c66348f')

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
