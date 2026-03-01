# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Its-Atharva-Gupta
_pkgname=Shellman
_appname=${_pkgname,,}
pkgname=${_pkgname,,}-bin
pkgdesc="A Terminal User Interface (TUI) based file manager, cross platform, build using textual and python"

pkgver=1.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname,,}")

makedepends=('tar')
depends=('glibc' 'zlib')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_appname}_${_barch[0]}.deb")
sha256sums=('bfe96dc2a86cb126a8c821ad253ded0479d3b0117114f23c13da30dc918f5239')
sha256sums_x86_64=('4aba14ab91d3a0b1e5b5ae8e2b8bcb021eca4a6118e5b3bbac86b068d368ef92')


prepare() {
	cd "${srcdir}/" || exit

	tar -xf "${srcdir}/data.tar.zst"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "usr/local/bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
