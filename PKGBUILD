# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=buntec
_gitname=btmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A browser-based terminal manager with tmux-inspired UI"

pkgver=0.0.138
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'zlib')

options=('!strip')

source=("CONFIGURATION-${pkgver}.md::${_ghurlraw}/docs/configuration.md"
		"INSTALLATION-${pkgver}.md::${_ghurlraw}/docs/installation.md"
		"AUTOMATION-${pkgver}.md::${_ghurlraw}/docs/automation.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('9ba98467fe8eba14cd562a0654ddd05b83b8689923bfef482d52b983bff75475'
            '1d145443f7021958b5e45e375b894abc260095bea7b45f9c52f4a0c6bd8ee7c7'
            'aef3b8d19b8b4fd891af59b16e4926b8ce63b3a39ed7a02eb01545427fb607b5'
            '6dbeab634ef5f48092acefd8f7bf488c15accf78f08b43f7bb124b1fd25e2107'
            '6767451d6f8834c148d0403d2a55fde5d5b70984059d28fe1c614ec8f08a3250')
sha256sums_x86_64=('6702748c61c60f98b20460cabedcb5afab1e21642e8c28f76246da09b6c3121d')
sha256sums_aarch64=('da55871b8f9315859f10d20b0ffdd82974e41f3b57db45af5c1e841d606670ad')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AUTOMATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AUTOMATION.md"
	install -Dm644 "INSTALLATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/INSTALLATION.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
