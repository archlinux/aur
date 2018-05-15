# Maintainer: spider-mario <spidermario@free.fr>
pkgname=openfx-neatvideo-demo
pkgver=4.7.2
pkgrel=1
pkgdesc="Video denoising plugin"
arch=('x86_64')
url="https://www.neatvideo.com/"
license=('custom')
depends=('fontconfig' 'libxi')
source=('https://www.neatvideo.com/demo/nv4/ofxd/NeatVideoOFX.Demo.Intel64.tgz')
sha512sums=('f75b7c69307acd27eeb2bc006b8df861f3f760375570d33fdbe83d179434d92a20f14323ea4e76e54479668f7f549f2b01ccc68dfc4b62a3526f2cc2fc96b7d8')

package() {
	echo | # “True” silent mode does not appear to do anything…
		./NeatVideo4OFX.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatVideo4OFX --mode console \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatVideo4OFX/uninstall

	install -Dm644 "$pkgdir"/opt/NeatVideo4OFX/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt

	install --directory "$pkgdir"/usr/OFX/Plugins/
	ln -s /opt/NeatVideo4OFX/NeatVideo4.ofx.bundle "$pkgdir"/usr/OFX/Plugins/NeatVideo4.ofx.bundle
}
