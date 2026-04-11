# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=MDA2AV
_gitname=gcannon
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="TCP HTTP Load generator for linux"

pkgver=0.5.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('liburing')
depends=('glibc' 'liburing')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('19837c85102375ed4e68e40b9e84ce053f4d4d34f8f4b80be615e1396d727106')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
