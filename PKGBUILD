# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.1.99.rc2
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
source=("file://zyn-fusion-linux-64bit-3.0.2-rc2-release.tar.bz2")
sha512sums=('2e677b152af00aa6543d7b63f545bc186adb508be51b0a9361ef505d173d3c2ed14a4de955c29343d83702e37668d61a1a495b82c748cc11ee7c824a3bf55ef5')

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
