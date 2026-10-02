# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=trikko
_gitname=tshare
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="The fastest way to share your files on the web, for free"

pkgver=1.1.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('libgcc' 'glibc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('e2b67eedf94384edc4fdaf446c23138f4180dade9a349c4f0fcca26ae70b3c48'
            '07f4bdbfe15464a8907125a3bb07491c54c913557713a225eb5c5c074994db1c')
sha256sums_x86_64=('0aa0358523e4a67607423198ab403e4968220ee2176dc2da812c13c359620bc9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
