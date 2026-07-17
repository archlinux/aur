# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gjcarneiro
_gitname=yacron
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A modern Cron replacement that is Docker-friendly"

pkgver=0.19.0
pkgrel=1
_gitversion=${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")
provides=("${_appname}")

depends=('glibc' 'zlib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.rst"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}")
sha256sums=('4646cd2242ea9fd39e0f8de128ba6c8af7fe2364d2c78fd2904b00164e2093c9'
            'dd8606675d5403d73675334922ef8151f70693abc6005a3a55d85d2b01fed73f')
sha256sums_x86_64=('52207ef4b99dec37576d3aa945574ff48db6685cf11f489f15212d9d7f552545')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
