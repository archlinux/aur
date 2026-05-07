# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>

_pkgauthor=control-theory
_pkgname=gonzo
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="TUI log analysis tool"

pkgver=0.4.0
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
sha256sums_x86_64=('c543f78ea7eee6467a553658aa62f61cb3d79886629291402604ee4d44c22212')
sha256sums_aarch64=('35b9fa4b30fd9ad21155b8167ae9600a06c93963793d8bf04b1d69368ecf3d89')


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
