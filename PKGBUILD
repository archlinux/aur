# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=tund
_suffix=cli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight virtual LAN tool that creates a private IPv4 subnet over UDP. Hub-and-spoke architecture, TUN interface, SipHash-2-4 auth and written in C."

pkgver=1.12
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
            'e0266fbe3c4157c9e3fc3d05d051f6be48acd7e6c4ab37de0c01337ade52507d'
            '5197f52f5399c01f54276e63135528d90e37b46cee9b4e82b34ad2847420f774'
            '2500e9ada332ac45496ee142cdf1eca36e694b25cd5cbd9216b365a2b6bb7106'
            'aff17247528f8cffa18cd138cfe8cfc08460284b56ed81bd054b960d940267ea')
sha256sums_x86_64=('b2ea68e60f9c7f91c2839bf56c74d1bd9a8a4dab7c320d743aacc0da262d35c2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
	install -Dm644 "TROUBLESHOOTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TROUBLESHOOTING.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
