# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=0xcd21h
_gitname=borg-commander
_appname=(${_gitname%-commander}{,-relay})
pkgbase=${_gitname}-bin
pkgname=(${_gitname}-bin ${_gitname}-relay-bin)
pkgdesc="Midnight Commander + Yazi + Terminal multiplexer"

pkgver=0.11.1
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
sha256sums=('d2d0fd36dab0aea4ebe2d4dfec6d03d1b092abcb9cf072ecc54e81b7bbb7bab8')
sha256sums_x86_64=('0888f2ae35ed334088a1c9d2b5efe750a1bc561f43d19365e7a00bd12e58fe86'
                   'd1f212c7f3f9a53310ed7750d98f1b612b0bc97d60043dba291e333eec29f98c')
sha256sums_aarch64=('a8fb7b6c5bbe9eed4dacc2cb189d39d459cd76d592bcc15986599ce047a34b86'
                    'f34be32a1fd2810628fc3f1b78f99ab422b9fb5f10e0236b7431add51cdb392d')


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
