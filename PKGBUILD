# Maintainer: Cian Ormond <aur@cianormond.com>
# Maintainer: Owen Wang <newo@duck.com>

pkgname=vatsim-manager
pkgver=0.2.1
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
sha256sums=('ea37a4ca0872d58e780bdc756f69a1a011a2cb0d78c449a73faf1e97e12bc2fa')
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
