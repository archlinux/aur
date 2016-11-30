# Maintainer: spider-mario <spidermario@free.fr>
pkgname=zyn-fusion
pkgver=3.0.1
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
source=("file://zyn-fusion-$pkgver-linux.tar.bz2")
sha512sums=('e06daac52c9c174843bdfb19912232816d0126e337ad97feeaf038b8735a389591eccc863164c6cc467065159608e69e82a60baf47476bd6268f2ffcead2117a')

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
