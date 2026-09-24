# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=profullstack
_gitname=mynaposter
_appname=myna
pkgname=${_gitname}-bin
pkgdesc="A terminal social media manager. Log in, write, schedule and post to 25 networks from one TUI."

pkgver=0.38.0
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
            'e1f114e53e147853d858358d2c88f03b3e38a121a84b4b02414398c1bcedcd41'
            'de1b680e8cf8ebf3641646e14f5c0730f726da2d9d6d211d498032c20d0d9e2c')
sha256sums_x86_64=('9979abd563f1d021410d4dc97625a0367ea4668983f84e2270b2e78626a83e98')
sha256sums_aarch64=('1416d34c5bd520db0912af59f00bd9f69f1499befacc69f72e1f5c9a3dc57e02')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "PLUGINS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PLUGINS.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
