# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=qiji-font
pkgver=0.0.4
pkgrel=1
pkgdesc="齊伋體 - typeface from Ming Dynasty woodblock printed books"
arch=('any')
url='https://github.com/LingDong-/qiji-font'
license=('custom:OFL')

_fontfiles=(
  'qiji-combo.ttf'
  'qiji-combo.woff2'
  'qiji-fallback.ttf'
  'qiji-fallback.woff2'
  'qiji.ttf'
  'qiji.woff2'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
for _file in "${_fontfiles[@]}"; do
  source+=("${pkgname}-${pkgver}-${_file}::${url}/releases/download/${pkgver}/${_file}")
done

sha256sums=(
  '05e866a893091ea73748403b7404cd6b979538421ee1a3622d2361fdc2c03a86'
  'f842291b039e9c5ae69edfe924edbe28b3cfba91bcac95791bf1fbc11db330cf'
  'ad34fa3a82102f04e0ca2117ba24ba0d2c8b0e34aeea154bae8eb631ffa3c60c'
  '01c1e4fab1e92b27e61a54adfdbf40b242d3e70ca535339ef2eb3a02bd6fd7a4'
  '77275dc1fa17b2dc79c3a6eeb12bdcfa6a897ceb1e8f0c9a6e358d5f68a8de67'
  '2ee30738d37b102bfa90e56cd04fde2620ccef012b44390b77b0703cf995cf5b'
  '46acdf7646e19ced2317f90fc2941bf628323917b4e261fa55798fd351788b7b'
)

package() {
  for _file in "${_fontfiles[@]}"; do
    install -Dm644 "${pkgname}-${pkgver}-${_file}" "${pkgdir}/usr/share/fonts/${pkgname}/${_file}"
  done

  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  for _file in screenshots/*; do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/${_file}"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
