# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=delta-walker-bin
pkgver=2.6.3
pkgrel=1
pkgdesc='File and folder comparison and synchronization'
arch=('x86_64')
url='https://www.deltawalker.com/'
license=('custom')
depends=('gtk3' 'jre11-openjdk')
provides=("delta-walker=${pkgver}")
conflicts=('delta-walker')
source=("https://s3.amazonaws.com/deltawalker/DeltaWalker-$pkgver-Linux.tar.gz"
        "local://delta-walker.desktop")
sha256sums=('56bcd3fb938701ec3e4a8c6063044c90ddb315ad4dabc00d0914669166935390'
            'SKIP')

prepare() {
	sed -i 's!jre/lib/amd64/server/libjvm.so!/usr/lib/jvm/java-11-openjdk/lib/server/libjvm.so!' DeltaWalker.ini
}

package() {
	mkdir -p "$pkgdir/opt/delta-walker"
	cp -r DeltaWalker DeltaWalker.ini configuration features icon.xpm p2 plugins "$pkgdir/opt/delta-walker"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/delta-walker/DeltaWalker "$pkgdir/usr/bin/DeltaWalker"

	mkdir -p "$pkgdir/usr/share/applications"
	cp delta-walker.desktop "$pkgdir/usr/share/applications"
}
