# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Gabriel M. Dutra <me@sizeofnull.xyz>

_pkgauthor=control-theory
_pkgname=gonzo
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="TUI log analysis tool"

pkgver=0.3.1
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
sha256sums=('9e342f077c0fe0e9d1cdd8919e26e897fc429e5b5b2268cdb8e9d4fd0fce0801')
sha256sums_x86_64=('73300569328549d4c08f322191a616da35d597ea230e447ada47095a4f6359a7')
sha256sums_aarch64=('669ecae052566304559e1de47fea1efbc4904c9ba36ed8a4f873957e3bf8f1dc')


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
