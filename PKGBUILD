# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yetidevworks
_gitname=drydock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A live TUI dashboard for a fleet of git repos"

pkgver=1.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('313527418e0c8c37ca0a49ddabeb4d7c71c81b9cd3fe2522cabb1f94f11a583d'
            'c13c90e64ceabc5dfe6450da43bb2479cd026feed99338bff3391677c65e1c6a')
sha256sums_x86_64=('88fa6dec6b366fac995af6448d9a683d015205599d4700e0938fef6813e4b7e5')
sha256sums_aarch64=('6e12f501aa4400473ef4cb27a47789e3b0277bdb9bd6a83bcedb988a6eab66e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
