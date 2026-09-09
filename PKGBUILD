# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Rajaonarison-Andry-Misandratra-Fiderana
_gitname=guardIT
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Linux TUI based firewall"

pkgver=0.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('nftables')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('430374bb2c6bd8136e40678e02d21e8da8d185488f8e0ca1f2f0ab81f87e32cf'
            'c89386163d662ba1d7b9333f2ece657f900958e733cf5fca7a2ab5b3aebc28a8')
sha256sums_x86_64=('69bc31105e51c6c066ad1b638d7e98312abbae667e9ba0cbab96e887e05881d4')


prepare() {
	cd "${srcdir}/" || exit

	sed -e 's|/usr/local/bin/|/usr/bin/|g' -i "${_appname}.service"
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.service" -t "${pkgdir}/usr/lib/systemd/system/"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
