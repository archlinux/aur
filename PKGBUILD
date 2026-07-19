# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=tund
_suffix=cli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight virtual LAN tool that creates a private IPv4 subnet over UDP. Hub-and-spoke architecture, TUN interface, SipHash-2-4 auth and written in C."

pkgver=1.14
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
		"USAGE-${pkgver}.md::${_ghurlraw}/docs/USAGE.md"
		"TECHNICAL-${pkgver}.md::${_ghurlraw}/docs/TECHNICAL.md"
		"TROUBLESHOOTING-${pkgver}.md::${_ghurlraw}/docs/TROUBLESHOOTING.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_suffix}-${_barch[0]}")
sha256sums=('c01a423b28a33749256456bc1a70597afc875614705f78dd5cc4face0f994933'
            'da1aa5c957dfc26e5158dec2b67f5aac3c53a512832f65ab17ea9646148c8a1e'
            '31dbb56bc24a9167e11e1735b787954ccae4d4940fab533434686530debfe4bf'
            '534817aa6b74cff33789d83493e53b974922ac1a73faa13c0780a5410846f54f'
            '992b36bc7afc6562c956d8f75f1a5c2353ab05d76c27b1f37ea161339ce05333')
sha256sums_x86_64=('f0f4a99ea2d8959bf8ef5667571bf1957bf43284515c0c774717781bca023bcf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
	install -Dm644 "TROUBLESHOOTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TROUBLESHOOTING.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
