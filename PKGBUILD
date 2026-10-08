# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=klpod221
_gitname=rtop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Rust Based Linux System Monitor"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-gnu' 'aarch64-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('0559d0875ab20771a2be321eb301be8b68aee3393834eda6025a25def425d190'
            'faa1f5852bcf0174cafc33fdb0a7ac5fb0a414f0e19bc838c6d3bd189d52f20d')
sha256sums_x86_64=('e68df00863a910a3b19c6133dd350b05e4929f7276f7151b9b2cacf287cd52f8')
sha256sums_aarch64=('58721f7b8bcdb6ff1d4c4695bdc2300e76d237c3525482d735593f1423fa16fa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
