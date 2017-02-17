# Maintainer: Frantisek Fladung <ametisf@gmail.com>

pkgname=velox-ametisf-git
pkgver=464.714e0b9
pkgrel=1
pkgdesc="Ametisf's fork of velox."
arch=('i686' 'x86_64')
url="https://github.com/ametisf/velox"
license=('MIT')
depends=('swc')
makedepends=('tup')
optdepends=('terminus-font: bitmap font for nicer rendering'
			'dstatus: status bar for velox')
conflicts=('velox')
provides=('velox')
source=("$pkgname::git+https://github.com/ametisf/velox.git")
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd $pkgname
	cat >> config.tup << "EOF"
ENABLE_DEBUG=0
PREFIX=/usr
EOF
	tup init
	tup upd
}

package() {
	mkdir -p $pkgdir/usr/{bin,share/{velox,licenses/velox},lib/pkgconfig}
	install -m 755 $pkgname/velox $pkgdir/usr/bin
	install -m 644 $pkgname/velox.xml $pkgdir/usr/share/velox
	install -m 644 $pkgname/LICENSE $pkgdir/usr/share/licenses/velox
	install -m 644 $pkgname/velox.pc $pkgdir/usr/lib/pkgconfig
}
