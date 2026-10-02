# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=mynaposter
_appname=myna
pkgname=${_gitname}-bin
pkgdesc="A terminal social media manager. Log in, write, schedule and post to 25 networks from one TUI."

pkgver=0.40.1
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
            '3b4676909f4db1c5869b612e7b16a34ed51bf4e4316c20ad7f2df43191479926'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('1d0aa3c76b9e69fcd15b8cf9a647a66d17f49215f0033c550e0d3c9ec08abbc8')
sha256sums_aarch64=('bc8fd8e72e41d9a69cc14e12166158dcefc48f78469357589595c6eb29b4cbb2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
