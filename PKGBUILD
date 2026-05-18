# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=sayanarijit
_gitname=jf
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="jf %q 'JSON Formatted'"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[1]}.tar.gz")
sha256sums=('6024efce21715e9ebccd9cfdc89ff2e27513fc203ed02ac2d3084f39519fd21c'
            '393e9f5a12c614e476ff7067b3fd330dc63304e92d6c3762fa9120cedc7e6b9c')
sha256sums_x86_64=('a60514ffa9d3d58a0e3f01389967c6c34578fbb4ab3a77ab168368145a56b069')
sha256sums_aarch64=('9346069c987b3fed18b55835b1a8d8a90473c71e2e6c455a7b9134e236b75be9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
