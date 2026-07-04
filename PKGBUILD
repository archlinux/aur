# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: tee < teeaur at duck dot com >

_pkgauthor=seeyebe
_pkgname=dude
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="A single-binary helper that discovers, previews and removes pacman orphans"
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0 OR MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc' 'pacman')

_tarball="${_pkgname}-${pkgver}-${_barch[0]}-unknown-linux-gnu"
source_x86_64=("$_tarball.tar.gz::${url}/releases/download/${_pkgvername}/$_tarball.tar.gz")
sha256sums_x86_64=('68f626974cb383929779619eff9114e3df9e9f12ad6ae318816350ef55ac4f20')


package() {
	cd "${srcdir}/${_tarball}" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "${_pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${_pkgname}.hook"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
	install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
