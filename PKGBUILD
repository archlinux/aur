# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=loqi
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A local-first, hackable, scriptable translation tool for desktop and developer workflows. Translate text, files, docs and structured content using local LLMs."

pkgver=0.6.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("CONFIG-${pkgver}.md::${_ghurlraw}/config/config.yaml"
		"TECHNICAL-${pkgver}.md::${_ghurlraw}/docs/TECHNICAL.md"
		"BENCHMARKS-${pkgver}.md::${_ghurlraw}/docs/BENCHMARKS.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums=('77dc12cba957880e6a0d510120838ac9a8e316bad44c04cb6e6d274e61d7509f'
            '8f90f93b83a54181dbce7751089228dcc5dea713f5ed23f3f21f54e17bcb6cf7'
            'd492d3d6be30999b60533bc8dd4f7832e60b5657f315684b604fc8275db0dab0')
sha256sums_x86_64=('8f5fc6439474054dbfc30e4f46ec567556a77cf4e7509c9acfa1da2a04f43970')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "CONFIG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
	install -Dm644 "BENCHMARKS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/BENCHMARKS.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
