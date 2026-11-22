# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=leonidsergueigr
_gitname=Musica
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal music player with folder browser, queue, playlists, live spectrum, cover art and mouse support"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'zlib')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('42fcec386c173665a20fc9a47679748db0d681eb51362243a5440db01fc23930')


package() {
	cd "${srcdir}/${_appname}-${pkgver}-Linux/" || exit

	install -Dm755 "bin/${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "share/man/man1/${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "share/doc/${_appname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "share/doc/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "share/doc/${_appname}/THIRD_PARTY_LICENSES.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
