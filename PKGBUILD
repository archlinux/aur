# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sayanarijit
_gitname=cottage
_appname=${_gitname}
_execname=(ctg{,x})
pkgname=${_appname}-bin
pkgdesc="A modern git based age-encrypted secrets manager for teams"

pkgver=0.6.5
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
sha256sums=('fe038c58d2f947976f1dd1d56876d6759fa9f1cf767b1a2313eaa16fd940e922'
            'f23c6fdb2a5fb41913a9509586ac4c350ffc5f804183c0fae4bacba60b5a8ad1'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('ec5a84fe24a8ea696344fa13bfe88401735699f6498898b480e4b471e63588b5')
sha256sums_aarch64=('a4867e07c39e5cf5f6c52aa2ef3782d2093d9d17cb0364ed7c676ef3a5ea4d3a')


package() {
	cd "${srcdir}/" || exit

	for bin in "${_execname[@]}"; do
		install -Dm755 "${bin}" "${pkgdir}/usr/bin/${bin}"
	done

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-${pkgver}-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
