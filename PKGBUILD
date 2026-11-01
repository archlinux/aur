# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=deemoun
_gitname=Directory-Navigator
_appname=dn
pkgname=${_gitname,,}-bin
pkgdesc="A modern terminal file manager built in Rust with Turbo Vision, inspired by DOS Navigator"

pkgver=1.1.4
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
sha256sums_x86_64=('f4e65cf0a92ac058439d2a007d57a0c2472f9ab2370d5acfda8fa27d5d58d1ad')
sha256sums_aarch64=('1eb723370fb99cb0bdef2a2edfc82bf31e7b4216ea167e4a6f090ae231428607')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "docs/USER_GUIDE.md" "${pkgdir}/usr/share/doc/${pkgname}/USER_GUIDE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
