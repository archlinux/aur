# Maintainer: Genstar <genstar@disroot.org>
pkgname=xipmsg
pkgver=0.8088
pkgrel=1
epoch=
pkgdesc="IP Messenger client for X11"
arch=(x86_64)
url="https://web.archive.org/http://www.bsddiary.net/xipmsg/"
license=('custom')
depends=('libice' 'libsm' 'libx11' 'libxau' 'libxaw' 'libxcb' 'libxdmcp' 'libxext' 'libxmu' 'libxpm' 'libxt' )
makedepends=('imake')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('d189ecd6c4d6bc0bd99f3338548363e3')
sha256sums=('ea54a8079437f5c8807ebb1adc00ea1ff204cfe114e78957039d85918921e1b0')

build() {
	cd "xipmsg-8088"
	sed -n '/\/\*/,/\*\//p' README | sed -E 's/.\*.?//m' > LICENSE
	xmkmf -a
	make
}

package() {
	cd "xipmsg-8088"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 xipmsg.man "$pkgdir/usr/share/man/man1/xipmsg.1"
	make DESTDIR="$pkgdir/" install
}
