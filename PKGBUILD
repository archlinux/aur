# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=JetpackDuba
_pkgname=Gitnuro
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgver=1.4.2
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
sha256sums_x86_64=('d65c2e2cf47a6f5f88d9259a61a56b66431c6154407f547b8ff0308d07f4dd43')
sha256sums_aarch64=('c271d6d582b814a8b910317f1344becabd2dba0b6fdea56509b4f7fb1f5b33cb')

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
