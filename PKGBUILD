# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Fast-Text-editor
_gitname=Fast-text-editor
_appname=${_gitname,}
pkgname=${_appname}-bin
pkgdesc="A fast customised text editor in rust"

pkgver=0.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname%-editor}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname%-editor}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('56d52540f3d6848deb1b18de7d06e00b6a3729cd9fe7c53524ebcef35fa78534')
sha256sums_aarch64=('5661a2af4ec9686011e3457063cca7e236f764e026e5fa5a0bccddb268cad89d')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_appname%-editor}-${_CARCH}/" || exit

	install -Dm755 "fast-text-gui" "${pkgdir}/usr/bin/fast-text-gui"
	install -Dm755 "fast-text" "${pkgdir}/usr/bin/fast-text"
	install -Dm755 "textwrite" "${pkgdir}/usr/bin/text-write"
	# install -Dm755 "ft" "${pkgdir}/usr/bin/ft"
	# install -Dm755 "tw" "${pkgdir}/usr/bin/tw"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
