# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=mynaposter
_appname=myna
pkgname=${_gitname}-bin
pkgdesc="A terminal social media manager. Log in, write, schedule and post to 25 networks from one TUI."

pkgver=0.44.4
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

options=('!strip')

source=("PLUGINS-${pkgver}.md::${_ghurlraw}/docs/plugins.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('08aebbbfcead94f793d4be6e7309f0e2e9354651abb05a0bb7fad68199d79574'
            '30336f2999b599042257dcd6c1ecf8a0e04221073ba34bc6f1c9886115d201d1'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('d9281e536d73da7f91869e43bdd6cd56dc32b62857320244a8880f0803e05efa')
sha256sums_aarch64=('9ac3a5198f14862a05061d4a8842526013918da2a31ac18b8f4b401495e068f7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
