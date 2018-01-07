# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.3
pkgrel=1
pkgdesc="ZynAddSubFX with a new interactive UI"
arch=('x86_64')
url="http://zynaddsubfx.sourceforge.net/zyn-fusion.html"
license=('custom')
depends=('fftw' 'libglvnd' 'mxml' 'jack2' 'liblo')
makedepends=('chrpath')
provides=('zynaddsubfx')
conflicts=('zynaddsubfx')
options=('!strip')
source=("file://$pkgname-linux-64bit-$pkgver-release.tar.bz2")
sha512sums=('bbceefdfef92fe4b163d4c583c2ea41b02af22707df235c1ec203f7bef82319201aaff16b52bd452957c872a91d8c5b9a65d6c9240200a404f0a35398096a45c')

build() {
	cd "$pkgname"
	chrpath -d zynaddsubfx ZynAddSubFX.so ZynAddSubFX.lv2/ZynAddSubFX{,_ui}.so
}

package() {
	cd "$pkgname"

	install -d "$pkgdir"/opt/"$pkgname"
	cp -a * "$pkgdir"/opt/"$pkgname"/

	install -d "$pkgdir"/usr/bin
	ln -s /opt/"$pkgname"/zyn{addsubfx,-fusion} "$pkgdir"/usr/bin/
	install -d "$pkgdir"/usr/share/zynaddsubfx
	ln -s /opt/"$pkgname"/banks "$pkgdir"/usr/share/zynaddsubfx/
	install -d "$pkgdir"/usr/lib/{vst,lv2}
	ln -s /opt/"$pkgname"/ZynAddSubFX.so "$pkgdir"/usr/lib/vst/
	ln -s /opt/"$pkgname"/ZynAddSubFX.lv2{,presets} "$pkgdir"/usr/lib/lv2/

	install -d "$pkgdir"/usr/share/licenses/"$pkgname"
	ln -s /opt/"$pkgname"/zyn-fusion-ELUA.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE # Not a typo…
}
