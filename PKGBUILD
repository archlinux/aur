# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=tund
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight virtual LAN tool that creates a private IPv4 subnet over UDP. Hub-and-spoke architecture, TUN interface, SipHash-2-4 auth, pure C."

pkgver=1.6
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
            '0baf2c65d080da115199201bfa2a576981e8c9267f76b6f7e7faec8eef6166e6'
            '5dc33d8bac3ba34a14f57559c59e726ec33191cc90ab8402caeb1b72fa97eca6')
sha256sums_x86_64=('94ea5d76e1da879ca5d62bec46da8e9ce5900edf0bd2d86ceb0a20e5d443dfa7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
