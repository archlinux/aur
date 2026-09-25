# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sayanarijit
_gitname=cottage
_appname=${_gitname}
_execname=(ctg{,x})
pkgname=${_appname}-bin
pkgdesc="A modern git based age-encrypted secrets manager for teams"

pkgver=0.7.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_execname[@]}")
conflicts=("${_appname}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}-MIT::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-${pkgver}-APACHE::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}-${_gitversion}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}-${_gitversion}.tar.gz")
sha256sums=('5919243f820589d17aca1f5accc9dd4ef53f4ba1c156e7c3cf0fb49c0e2bebe0'
            'f23c6fdb2a5fb41913a9509586ac4c350ffc5f804183c0fae4bacba60b5a8ad1'
            '0d8ae3957a7b90ee4ecec8e790da237d70a500abf6b0b1ac08d4d85e964f1b76')
sha256sums_x86_64=('07fa28408ddce741d10f25e46b65d1c1d4a97bff8e1295608c8b9603212fecd0')
sha256sums_aarch64=('1b34b70f5d7142c77520638ec43b1dd29455283f39a0d719c1f301a2aecaaac6')


package() {
	cd "${srcdir}/" || exit

	for bin in "${_execname[@]}"; do
		install -Dm755 "${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-${pkgver}-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
