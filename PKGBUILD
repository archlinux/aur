# Maintainer: <tjmnkrajyej at gmail dot com>
pkgname=circle
pkgver=1.0.0_200
pkgrel=1
pkgdesc='a C++ compiler with many novel language features'
arch=(x86_64)
url=https://circle-lang.org
license=(custom)
depends=('gcc>=10.2')
source=(https://www.circle-lang.org/linux/build_`curl 'https://www.circle-lang.org/linux/?C=M;O=D' -s | grep -Po '(?<=build_(?!latest)).+?(?=\.tgz)' | head -1`.tgz)
sha256sums=(SKIP)

prepare() {
	mkdir -p libedit
	ln -sf /usr/lib/libedit.so libedit/libedit.so.2
}

pkgver() {
	LD_LIBRARY_PATH=libedit ./circle -version | head -1 | grep -Po '(?<=version ).+' | sed 's/-/_/g'
}

package() {
	ln -sf /usr/lib/libedit.so
	install -D libedit.so "$pkgdir/usr/lib/libedit.so.2"
    install -Dm 755 circle "$pkgdir/usr/bin/circle"
    install -Dm 664 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
