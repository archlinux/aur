# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=deemoun
_gitname=Directory-Navigator
_appname=dn
pkgname=${_gitname,,}-bin
pkgdesc="A modern terminal file manager built in Rust with Turbo Vision, inspired by DOS Navigator"

pkgver=1.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('253dea1f0705b230f1a66f6cc6f88feb7d7c03367ad0abae86453390fb47d406')
sha256sums_aarch64=('c925ec528cf24ef24a9762f619124aef327e88fb585237e9cbf6871b06ffd26e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "docs/USER_GUIDE.md" "${pkgdir}/usr/share/doc/${pkgname}/USER_GUIDE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
