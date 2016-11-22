# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.0
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
source=("file://zyn-fusion-$pkgver-linux-x86_62.tar.bz2") # Yeah…
sha512sums=('7189d412f707f16747dcd9965877fa0410709bac18c794d6800cc70973ae84893c52edfc7391638adc31e23287f190d0ebe41a9b899018b35dfa8b91453a9a39')

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
	ln -s /opt/"$pkgname"/zyn-fusion-ELUA.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE # Not a typo either…
}
