# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lucas-farias07
_gitname=windowrun
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fzf-based app launcher"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MPL-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('fzf')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}")
sha256sums=('6c2f85fb4bc19d1ba5bfa62a743768150dce13fb472b934172571aca41427543'
            'a7aa7cc22f8dcfeec782a313f94a895c820b33db6d4d080e0dc7285853bdee75')
sha256sums_x86_64=('c80b261687d403652fd0cda6479306f1890f91badfcd0b0a1c2b7fca2eb6ed38')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
