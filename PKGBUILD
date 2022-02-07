# Maintainer: Cian Ormond <aur@cianormond.com>
# Maintainer: Owen Wang <newo@duck.com>

pkgname=vatsim-manager
pkgver=0.2.0
pkgrel=2
pkgdesc="Installer and manager for VATSIM clients"
arch=('x86_64')
url="https://github.com/wiggleforlife/vatsim-mgr"
license=('GPL3')
makedepends=('cmake>=3.16.0'
	     'curl>=7.68.0')
optdepends=('wine: ATC and AFV client support'
	    'winetricks: ATC and AFV client support')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('decb8700ab213dd5c6893fcade608a3c70e2eec348d031235595b4a2ed78d1e7')
options=('!buildflags')

build() {
	cd "$srcdir/vatsim-mgr-$pkgver"
	mkdir build && cd build
        cmake ..
	make
}

package() {
	cd "$srcdir/vatsim-mgr-$pkgver/build"
        chmod +rwx vatsim-mgr
	install -D vatsim-mgr "$pkgdir/usr/bin/vatsim-mgr"
}
