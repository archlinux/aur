# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=0xcd21h
_gitname=borg-commander
_appname=(${_gitname%-commander}{,-relay})
pkgbase=${_gitname}-bin
pkgname=(${_gitname}-bin ${_gitname}-relay-bin)
pkgdesc="Midnight Commander + Yazi + Terminal multiplexer"

pkgver=0.11.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-musl' 'aarch64-unknown-linux-musl')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0' 'MIT')

conflicts=("${pkgname%-bin}")

options=('!strip')

source=("GUIDE-${pkgver}.md::${_ghurlraw}/docs/GUIDE.md")
source_x86_64=("${_appname[0]}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname[0]}-${pkgver}-${_barch[0]}.tar.gz"
			   "${_appname[1]}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname[1]}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname[0]}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname[0]}-${pkgver}-${_barch[1]}.tar.gz"
				"${_appname[1]}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname[1]}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums=('e31bc7a90f60cf6ccc3732d921dea2c81c848d5eaf058bfce112ff9f59fcc04d')
sha256sums_x86_64=('ff7fd368764d5459e588eb24762872f0ec10480d8d081b4b96b6249e3d2b1173'
                   '8f2f3942eb296afd13fb753fd6a2a34ae8532443dca9c73f594e5ee90f1588b4')
sha256sums_aarch64=('4f406d4dabb0bc34ab0cc285b579d1ef4e5e38da9c8cacebae74773c03f65b0b'
                    '07d137c1edcfab57cf67a0e488b500461ce5b3644000e3d7c5172577dcbd45bd')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac


package_borg-commander-bin() {
	provides+=(${_appname[0]})

	cd "${srcdir}/${_appname[0]}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_appname[0]} -t "${pkgdir}/usr/bin/"

	install -Dm644 fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 fonts/README.md "${pkgdir}/usr/share/doc/${pkgname}/FONTS.md"
	install -Dm644 ../GUIDE-${pkgver}.md "${pkgdir}/usr/share/doc/${pkgname}/GUIDE.md"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 SYNTAX-LICENSES.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 fonts/SymbolsNerdFont-LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_borg-commander-relay-bin() {
	provides+=(${_appname[1]})

	cd "${srcdir}/${_appname[1]}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 ${_appname[1]} -t "${pkgdir}/usr/bin/"

	install -Dm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
