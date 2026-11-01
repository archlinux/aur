# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=JetpackDuba
_pkgname=Gitnuro
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgver=2.1.0
pkgrel=1
_sourceversion=${pkgver%\.0}-${pkgver}
pkgdesc='A FOSS Git multiplatform client for newbies and pros'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"

arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')

depends=('java-runtime' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
provides=("${_execname}")

source=("${_execname}.svg" "${_execname}.desktop"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.jar::${url}/releases/download/${pkgver}/${_pkgname}-linux-${arch[0]}-${_sourceversion}.jar")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}.jar::${url}/releases/download/${pkgver}/${_pkgname}-linux-arm_${arch[1]}-${_sourceversion}.jar")
sha256sums=('40625c5934897ac2290c0ace5a24b72a7d62ce7cde305cefa92f82b8d5e1ddab'
            'c881f04e9af5eb3ec865656c91880748d503a0ce929d2a09e0a571629e43c240'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '03e534fb67226ea2983d15f4429b6e131cdb1786717a6e8c47fd9cfb9c467a81')
sha256sums_x86_64=('e0da4a2ab1af8fd5ba78c5ec017258328209e6fbdc062970b4d3394be0237ee7')
sha256sums_aarch64=('020fcbf1ee85dff431c9d728bdf7047ef74848008b6df302111905be9292f49c')

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
