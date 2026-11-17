# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=yetidevworks
_gitname=drydock
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A live TUI dashboard for a fleet of git repos"

pkgver=1.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_appname}")

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('ffc13b43f8cf467e1113241ff90c797d18ec0976ccae0f51e256959d1933ac02'
            'c13c90e64ceabc5dfe6450da43bb2479cd026feed99338bff3391677c65e1c6a')
sha256sums_x86_64=('55e2aac5b2fb2bf28a323664727a0e76ec95d21d5e3057476ba575626e993cd6')
sha256sums_aarch64=('c5d13f04f7752c7957b5c2415c36e8df7271d1d2573abc3065d6f92b92f5962b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
