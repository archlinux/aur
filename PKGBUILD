# Maintainer: Cian Ormond <aur@cianormond.com>
# Maintainer: Owen Wang <newo@duck.com>

pkgname=vatsim-manager
pkgver=0.2.0
pkgrel=3
pkgdesc="Installer and manager for VATSIM clients"
arch=('x86_64')
url="https://github.com/wiggleforlife/vatsim-manager"
license=('GPL3')
makedepends=('cmake>=3.16.0'
	     'curl>=7.68.0')
optdepends=('wine: ATC and AFV client support'
	    'winetricks: ATC and AFV client support')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ffa6c74b487e3bb07b755010a2a4acbf9ea35fe1ae5053425e7b36eb2bc4ab80')
options=('!buildflags')

build() {
	cd "$srcdir/vatsim-manager-$pkgver"
	mkdir build && cd build
        cmake ..
	make
}

package() {
	cd "$srcdir/vatsim-manager-$pkgver/build"
        chmod +rwx vatsim-mgr
	install -D vatsim-mgr "$pkgdir/usr/bin/vatsim-mgr"
}
