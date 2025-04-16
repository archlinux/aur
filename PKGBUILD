# Maintainer: SEGFAULT <segfault@mailbox.org>
pkgname=spacemidi
pkgver=1.0
pkgrel=1
pkgdesc="GUI tool for translating space mouse devices into midi controllers"
arch=(x86_64)
url="https://gitlab.com/IGBC/spacemidi"
license=('GPL-3.0-or-later')
depends=(spacenavd libspnav libgtkmm-4.0.so libjack.so libsigc-3.0.so glibc gcc-libs glibmm-2.68)
makedepends=('cmake')
source=("spacemidi-v$pkgver.tar.gz::https://gitlab.com/IGBC/spacemidi/-/archive/v$pkgver/spacemidi-v$pkgver.tar.gz")
sha256sums=(SKIP)

build() {
	mkdir -p "$srcdir/spacemidi-v$pkgver/build"
	cd "$srcdir/spacemidi-v$pkgver/build"
	cmake ..
	make
	}

package() {
	# upstream package provides no install script
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/spacemidi-v$pkgver/spacemidi.desktop" "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	cp "$srcdir/spacemidi-v$pkgver/spacemidi.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	
	mkdir -p "$pkgdir/usr/bin/"
	cp "$srcdir/spacemidi-v$pkgver/build/spacemidi" "$pkgdir/usr/bin/"
	}
