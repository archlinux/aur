# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lusingander
_gitname=sauva
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal Unicode Explorer"

pkgver=0.7.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

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
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('262563102dc2f62fdb2d01366be20e7507924260c27139126258a5719dc4340c'
            '3b607b61bbba8e9b3bd2528080993dc454268b7b3c185ae98d02057ac5ddcc3f')
sha256sums_x86_64=('3611a2c9d2248f14a4ed1064dba2fdb69579a7c2cb44e3aa7a9da1e0a9f825a6')
sha256sums_aarch64=('1ef23147f7898235338a9756e7b4db77831e7dbe2ec95142e785834fbda687b5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
