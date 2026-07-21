# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danterolle
_gitname=tund
_suffix=cli
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Lightweight virtual LAN tool that creates a private IPv4 subnet over UDP. Hub-and-spoke architecture, TUN interface, SipHash-2-4 auth and written in C."

pkgver=2.1
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
            '4ddd781751ce74e1a3f942b5a167f739134d301698c28cc69d6d37c2247a9041'
            '0b42f3c574e3b4c1f8d8abba2f217743d8c9f7ffbc7f96f948a6b9cb7ec374fb'
            '69fa442f1c9a5d13083d9251742fd85a8fc6e396c7de175b9272e94736383596'
            '8388cb0a285b503dd239c86235531d16ccb115fbf4ae7bf31e9ae3902c59223c')
sha256sums_x86_64=('47fc3394bb90205e139c97c5ecf8a910763cff1a07b1857fd89cf7a03d9da411')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "TECHNICAL-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TECHNICAL.md"
	install -Dm644 "TROUBLESHOOTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TROUBLESHOOTING.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
