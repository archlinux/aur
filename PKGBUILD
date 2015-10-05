# Maintainer: Sean Baggaley <coffeescripter at gmail dot com>
pkgname=zfc9000
pkgver=1.0
pkgrel=1
pkgdesc="A text-based Zandronum RCon client"
arch=(i686 x86_64)
url="http://doomseeker.drdteam.org/"
license=("GPL2")
depends=('ncurses')
makedepends=('gcc' 'cmake' 'make' 'mercurial')
source=("$pkgname::hg+https://bitbucket.org/crimsondusk/zfc9000"
		"revfix.patch")
sha256sums=('SKIP'
            '5ad3a7c19d8e1921f5224ed79f31442f32935081b563cd4e4ddb80987b39c2a6')

_bbdir=$pkgname

prepare() {
	cd $srcdir/$_bbdir
	hg update $pkgver
	patch -p1 <"$srcdir/revfix.patch"
}

build() {
    cd $srcdir/$_bbdir
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make -j$(nproc)
}

package() {
	cd $srcdir/$_bbdir/build
	install -Dm755 zfc9000 "$pkgdir/usr/bin/zfc9000"
}
