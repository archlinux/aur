# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=JetpackDuba
_pkgname=Gitnuro
_execname=${_pkgname,,}
pkgname=${_execname}-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='A FOSS Git multiplatform client for newbies and pros'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
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
sha256sums_x86_64=('623eed4aa7596a0e8862a19fa63e8956db26b8a116f0b86facbdb5b13dc269b5')
sha256sums_aarch64=('7d24accb8581fd5c36c6da3b2822270b935d6f1b286854a84aa9d6edf9d4e0df')

prepare() {
  cd "${srcdir}/" || exit

  echo '''
#!/bin/sh

me=`realpath $0`
exec java -jar $me "$@"
  ''' > header
}

build() {
  cd "${srcdir}/" || exit

  cat header "${pkgname}-${CARCH}-${pkgver}.jar" > ${_execname}
  rm -rf header
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "${_execname}.desktop" "${pkgdir}/usr/share/applications/${_execname}.desktop"
  install -Dm644 "${_execname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_execname}.svg"
}
