# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simoarpe
_gitname=ziggity
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="⚡️ Ziggity an ultra fast, keyboard driven terminal UI for Git, written in Zig."

pkgver=0.19.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-linux-musl' 'aarch64-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('18d65acf8dcb0619f2a90e74e8c343f1c1418505e5ec0059e97faed9363fe6eb'
            '233ff8831d0647d24e8adbe4a5c32a8148f570220dd8ccacf52920a41ebab8b3')
sha256sums_x86_64=('082c16b64f882de226d38149be584ccff28c41e48a6ffac10e992610c305e22b')
sha256sums_aarch64=('f0b06e7b6b897c8b67da7ce17426fdab423f96e81d62ad05c5a43ba25b5f8c2a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
