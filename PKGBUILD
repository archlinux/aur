pkgname=roguedetector
pkgver=29
pkgrel=1
pkgdesc="helps system administrators to detect rogue DHCP server entities"
arch=(i686 x86_64)
url="https://code.google.com/p/roguedetector/"
license=('GPL')
depends=('libconfig' 'libnet' 'libpcap' 'gcc-libs')
backup=('etc/rogue_detector.cfg')
source=("https://arch.p5n.pp.ru/~sergej/dl/2018/roguedetector-source-archive.zip"
	"roguedetect.service")
sha256sums=('c3f98071141c18a279408efbf2f64fa332d3bf40f89e917aac6b29976fac0eaf'
            '5770f688939da351d08c6c86d51295acf88d6b6acd15abc8c62bdca73910a748')

prepare() {
	cd "$srcdir/roguedetector/trunk/RogueDetect"
	sed -i 's|long int duration|int duration|g' App.cpp
}

build() {
	cd "$srcdir/roguedetector/trunk/RogueDetect"
	make
}

package() {
	cd "$srcdir/roguedetector/trunk/RogueDetect"
	install -Dm0755 dist/Debug/GNU-Linux-*/roguedetect $pkgdir/usr/bin/roguedetect
	install -Dm0644 rogue_detector.cfg $pkgdir/etc/rogue_detector.cfg
	install -Dm0644 $srcdir/roguedetect.service $pkgdir/usr/lib/systemd/system/roguedetect.service
}
