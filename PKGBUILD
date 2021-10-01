# Maintainer: Waffle Lapkin <waffle.lapkin@gmail.com>
pkgname='anilibria-winmaclinux'
pkgver=1.0.3
pkgrel=1
pkgdesc='AniLibria client for major desktop platforms (stable)'
arch=('x86_64')
url='https://github.com/anilibria/anilibria-winmaclinux'
license=('GPL3')
depends=('qt5-webview' 'gst-libav' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-websockets' 'qt5-quickcontrols')
makedepends=('qt5-base' 'qt5-multimedia' 'qt5-svg')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/anilibria/anilibria-winmaclinux/archive/refs/tags/$pkgver.tar.gz"
		"0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch"
		"0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
		"0001-disable-version-check.patch")
sha256sums=('a86831098b884530eec4b6d6e91abf00d77e0d45f5c8991f6bfe015b83b8741d'
            '31185f54427a0b14a4992672477fe2ae79aefd408c92ded1f3730bed55af4649'
            '9d700ba5a449b1ec7e9403d61aaf334e30bc6499c412f2bdcc9bd862e7ad2ca4'
            '4099873fd5e3276a3a59d56d035aecae67fb6cc4ce6ea64aec90c1149dc657c9')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch"
	patch -p1 -i "$srcdir/0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
	patch -p1 -i "$srcdir/0001-disable-version-check.patch"
}

build() {
	cd "$pkgname-$pkgver/src"
	qmake PREFIX=/usr
	make -j$(nproc)
}

check() {
	cd "$pkgname-$pkgver/src"
	make -k check
}

package() {
	cd "$pkgname-$pkgver/src"
	make DESTDIR="$pkgdir/" install
}
