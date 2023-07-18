# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgname=sulis
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Turn based tactical RPG with several campaigns, written in Rust"
arch=('x86_64')
url="https://www.sulisgame.com"
license=('GPL3')
provides=('sulis')
depends=('alsa-lib')
makedepends=('gendesk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Grokmoo/sulis/releases/download/${pkgver}/sulis-${pkgver}-linux64.zip"
	"sulis_bin"
	"sulis.png")
sha256sums=('433d0108530c5767264d0082de525435e19a4252206477eaca4c9bcb8846fb9f'
            '6d8ced049367da414371ed04a2e420a3a77883cb8df771cf56c70d50ab190bf3'
            '7bffe4886ea6dc139135790f8711611a1cccdc8d3b318ae18ff3227e915c604d')

prepare() {
	gendesk -f -n --pkgname "sulis" --pkgdesc "${pkgdesc}" --exec="sulis" --categories=Game --icon sulis
}

package() {
	cd ${startdir}
	install -Dm755 'sulis_bin' "${pkgdir}/usr/bin/sulis"
	install -Dm644 'sulis.png' -t "${pkgdir}/usr/share/pixmaps"
	cd "${srcdir}"
	install -Dm644 'sulis.desktop' -t "${pkgdir}/usr/share/applications"
	cd "sulis/"
	mkdir -p ${pkgdir}/opt/sulis
	cp -R ${srcdir}/sulis/* ${pkgdir}/opt/sulis/
	install -Dm644 'docs/GPLv3-LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
