# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=tund
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight virtual LAN tool that creates a private IPv4 subnet over UDP. Hub-and-spoke architecture, TUN interface, SipHash-2-4 auth, pure C."

pkgver=1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"TECHNICAL-${pkgver}.md::${_ghurlraw}/docs/TECHNICAL.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_barch[0]}")
sha256sums=('c01a423b28a33749256456bc1a70597afc875614705f78dd5cc4face0f994933'
            '7bf43003d34e6caf65f0a954c7bc97844cc7d0f790d427fe652072aff6bfdd9b'
            '55cfc599579736a083896724419af124b111c3aaedd07c934f17cc8e9b84d8fd')
sha256sums_x86_64=('2a747632f1fe4ed60eded626e0e107bad39e4767f5c990ff178ff95f186da7c2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
