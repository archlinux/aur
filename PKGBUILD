# Maintainer: Cian Ormond <aur@cianormond.com>
# Maintainer: Owen Wang <newo@duck.com>

pkgname=vatsim-manager
pkgver=0.2.2
pkgrel=1
pkgdesc="Installer and manager for VATSIM clients"
arch=('x86_64')
url="https://github.com/wiggleforlife/vatsim-manager"
license=('GPL3')
makedepends=('cmake>=3.16.0'
	     'curl>=7.68.0')
optdepends=('wine: ATC and AFV client support'
	    'winetricks: ATC and AFV client support')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('828847e99f619ed9c3c02e655f36a6bb7bf51e982b6ca73f136a42b8409e8b6c')
options=('!buildflags')

build() {
	cd "$srcdir/vatsim-manager-$pkgver"
	mkdir build && cd build
        cmake ..
	make
}

package() {
	cd "$srcdir/vatsim-manager-$pkgver/build"
        chmod +rwx vatsim-manager
	install -D vatsim-manager "$pkgdir/usr/bin/vatsim-manager"
}
