# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=JetpackDuba
_pkgname=Gitnuro
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='A FOSS Git multiplatform client for newbies and pros'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('jdk-openjdk')
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
            '2a389f0259761270df7f59a559c2aec0dea0ea18f2eef6611d6b3e9cabee4ac8')
sha256sums_x86_64=('b8ac49cb59b764125213b4059f8a5830d6c97df27d8a26c88ca79bddc59eff28')
sha256sums_aarch64=('297ced86fe034cc58eaf9ec62233384f33377697af0ce9f1b267fb33b140ef6f')

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
