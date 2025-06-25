# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=JetpackDuba
_pkgname=Gitnuro
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgver=1.5.0
pkgrel=2
pkgdesc='A FOSS Git multiplatform client for newbies and pros'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('java-runtime' 'hicolor-icon-theme')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_execname}.svg" "${_execname}.desktop"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}-${pkgver}.jar")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}.jar::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm_${arch[1]}-${pkgver}.jar")
sha256sums=('40625c5934897ac2290c0ace5a24b72a7d62ce7cde305cefa92f82b8d5e1ddab'
            'c881f04e9af5eb3ec865656c91880748d503a0ce929d2a09e0a571629e43c240'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'bb1c63a772d78a429b6fb24a644a6331efd79eb5ed3238fefdfbc51a5701aa69')
sha256sums_x86_64=('128063c3df0ee603b6c133b7e0a32215eb5eaf261aa590bcdcc51f22ac6d6e64')
sha256sums_aarch64=('a009826a9bbdc454b52cc6ac8f6d6adfd43fe328cb87a319c7bf6d0bc62395e7')

prepare() {
  cd "${srcdir}/" || exit

  echo """
#!/bin/sh

java -jar /usr/lib/${pkgname}/${_pkgname}.jar "$@"
  """ > ${_execname}
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm755 "${pkgname}-${CARCH}-${pkgver}.jar" "${pkgdir}/usr/lib/${pkgname}/${_pkgname}.jar"

  install -Dm644 "${_execname}.desktop" "${pkgdir}/usr/share/applications/${_execname}.desktop"
  install -Dm644 "${_execname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_execname}.svg"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
