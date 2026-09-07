# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pelazas
_gitname=p2pmux
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Multiplayer terminal multiplexer where multiple users and machines can connect to a same session"

pkgver=0.1.16
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

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('0d8c8c8969c1d5baa1ce66806a1397f2ed38dcc5454f3731a5905b790f2091b1'
            '5519ced3c2efd392b25ccfd59c9cc9ba8c67d2348d53115a7881a4276c988018')
sha256sums_x86_64=('453c416fd8cb039f6d549ab635c93ac3a044ee9cba7d88eee47f1e86a981013c')
sha256sums_aarch64=('9fddd11699ac33700209682fb9701c4da8f1154779e24b31983c61afd30b854d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
