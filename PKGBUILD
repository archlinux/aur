# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simoarpe
_gitname=ziggity
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="⚡️ Ziggity an ultra fast, keyboard driven terminal UI for Git, written in Zig."

pkgver=0.18.0
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
sha256sums=('50c11e27f02ce8a09ef0e815c01771295f21c4d301752faf0cccc1fc4c744ec8'
            '233ff8831d0647d24e8adbe4a5c32a8148f570220dd8ccacf52920a41ebab8b3')
sha256sums_x86_64=('8173e3be2f113c933044d1394179c06ba1cd1c707b5328e4826b1a6f153fa8fe')
sha256sums_aarch64=('d474d5d4f314de247cc0b11d9275265ebbe8784fc06eec300c4f295c225df808')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
