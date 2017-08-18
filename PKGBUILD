# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.2.patch4
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
source=("file://zyn-fusion-linux-64bit-3.0.2-patch4-release.tar.bz2")
sha512sums=('8379f2e15f74b18dfa110752a248e509c40e1d4ed314a3ccd95bd94f8a8d78afa01e28ac8a7285fcbc6f62e229672611f7baf2cdf42e8ae9a6b1c8357282a2db')

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
