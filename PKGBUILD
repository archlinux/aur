# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=danpozmanter
_gitname=waftty
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A light terminal emulator"

pkgver=0.9.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'hicolor-icon-theme')

options=('!strip')

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('cbf72cad2aed8414b83bcc099cc31c8e9582b3b2e99e2e8a69a99fda598b49a4')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;

	${arch[1]})
		_CARCH=${_barch[1]}
	;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 bin/${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 share/applications/*.desktop -t "${pkgdir}/usr/share/applications/"

	install -Dm644 share/icons/hicolor/128x128/apps/*.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"

	install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
	cp -rfa share/doc/${_appname}/* "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 ../LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
