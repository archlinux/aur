# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sdogruyol
_gitname=cryload
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Powerful HTTP Benchmarking Tool"

pkgver=5.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'pcre2' 'zlib' 'openssl')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('a10aff803e4904ea2052468bf394177d59d4cbb493f0a70e9a1f0e22815ce607'
            'b40b8f9f325747655be5597be3864c289584e3bac44f2d03a368c26e69434ee1')
sha256sums_x86_64=('5689819f07d4f936f84c1c84907cb5451809a9ec856c0843dc2cdae9c492af60')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
