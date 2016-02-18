pkgname=renderdoc
pkgver=0.27
pkgrel=1
pkgdesc="RenderDoc is a stand-alone graphics debugging tool."
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
depends=(qt5-x11extras)
source=("https://github.com/baldurk/renderdoc/archive/v$pkgver.tar.gz" "$pkgname.desktop")
sha256sums=('bcb3dba88d07c57ba84830578da9b49c56ff5071e33b3f97bdeb265fb0040a63'
            'eab4941dc17fbbdcb9e34a698c3b304d212be54956daeb0c3b1cf5b7f2b00984')

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd $pkgname-$pkgver/bin
	install -Dm644 librenderdoc.so "$pkgdir/usr/lib/librenderdoc.so"
	install -Dm755 qrenderdoc "$pkgdir/usr/bin/qrenderdoc"
	install -Dm755 renderdoccmd "$pkgdir/usr/bin/"
	cd ..
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	cd docs/imgs
	install -Dm644 logo.png "$pkgdir/usr/share/icons/$pkgname.png"
}
