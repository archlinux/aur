# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>

_pkgauthor=control-theory
_pkgname=gonzo
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="TUI log analysis tool"

pkgver=0.4.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source=("USAGE_GUIDE-${pkgver}.md::${_urlraw}/USAGE_GUIDE.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('3ebf38fe0fce57e39a0f8fd6cde50b92944311825fdfaab78698316bb71d9deb')
sha256sums_x86_64=('fb0a6d66677f10e31f8b510692ac62eb50784000d5f3557a0c3568f604748a2c')
sha256sums_aarch64=('35d5bd0f0e52a9f76c65a3073bd75c7fdff5aa8ddb064bda3fa503dcc827bed5')


check() {
  ./${_appname} version
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "USAGE_GUIDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE_GUIDE.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
