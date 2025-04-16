# Maintainer: SEGFAULT <segfault@mailbox.org>
pkgname=spacemidi-git
pkgver=0.1
pkgrel=1
pkgdesc="GUI tool for translating space mouse devices into midi controllers"
arch=(x86_64)
url="https://gitlab.com/IGBC/spacemidi"
license=('GPL-3.0-or-later')
depends=(spacenavd libspnav libgtkmm-4.0.so libjack.so libsigc-3.0.so glibc gcc-libs glibmm-2.68)
makedepends=('cmake' 'gtkmm3')
source=("spacemidi-main.tar.gz::https://gitlab.com/IGBC/spacemidi/-/archive/main/spacemidi-main.tar.gz" "spacemidi.desktop")
noextract=("spacemidi.desktop")
sha256sums=(SKIP 'a7c6bac30d65f73c123913c0fe2e15630a616b8a86f598fcf2dce0218ee6d04f')

build() {
	mkdir -p "$srcdir/spacemidi-main/build"
	cd "$srcdir/spacemidi-main/build"
	cmake ..
	make
	}

package() {
	# upstream package provides no install script
	mkdir -p "$pkgdir/usr/share/applications"
	cp "spacemidi.desktop" "$pkgdir/usr/share/applications/"
	
	cd "$srcdir/spacemidi-main/build"
	mkdir -p "$pkgdir/usr/bin/"
	cp "spacemidi" "$pkgdir/usr/bin/"
	}
