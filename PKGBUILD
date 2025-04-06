# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: replydev <commoncargo@tutanota.com>

_pkgauthor=replydev
_pkgname=cotp
pkgname=${_pkgname}-bin
pkgver=1.9.3
pkgrel=1
pkgdesc="Trustworthy, encrypted, command-line TOTP/HOTP authenticator app with import functionality"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-or-later')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gcc-libs' 'glibc')
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-linux.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-linux.tar.xz")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '4a47e633897568d07c139d74e97b0b5064c4a89863635b35ebddc4b38a1bdd90')
sha256sums_x86_64=('b778b91c687bf8c02c56cc8c40a1492d03aafa1c9a35363a626453bff54b9493')
sha256sums_aarch64=('b748b2fa09c9453c2951c16de089fe9188d5845e845f06f23502747ca39957e5')

build() {
	cd "${srcdir}/" || exit

	help2man "./${_pkgname}-${pkgver}-${CARCH}-linux/${_pkgname}" --output "MAN-${pkgver}.1" --no-info

	gzip "MAN-${pkgver}.1"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "./${_pkgname}-${pkgver}-${CARCH}-linux/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}

