# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=anthonyamaro15
_gitname=file-finder-rust
_appname=${_gitname%-rust}
_execname=ff
pkgname=${_appname}-bin
pkgdesc="Fast TUI file finder built in Rust — global & local search, open in editor, copy paths, and more"

pkgver=0.3.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_execname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_execname}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('a3a5783a9f37eb69ede90993a3b631e6a5f1340d9be421bdf91d4606f68e5ccf')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_execname}-${_CARCH}/" || exit

	install -Dm755 "${_execname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
