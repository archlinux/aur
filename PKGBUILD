# Maintainer: QwertyAdrian <me at qwertyadrian dot ru>
# Contributor: Vikkir Tomoyan <vikkirtomoyan at tutanota dot com>
# Contributor: Kirill Viks <kirillvix at yandex dot com>

pkgname='anilibria-winmaclinux'
pkgver=2.2.26
pkgrel=1
pkgdesc='AniLibria client for major desktop platforms (stable)'
arch=('x86_64')
url='https://github.com/anilibria/anilibria-winmaclinux'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-quickcontrols2' 'qt5-websockets')
makedepends=('qt5-base' 'qt5-multimedia' 'qt5-svg')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/anilibria/anilibria-winmaclinux/archive/refs/tags/$pkgver.tar.gz"
		"0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch"
		"0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
		"0001-disable-version-check.patch")

sha256sums=('a2f3c46cc848c5d89b15bcd0e63085e5aa4ef95ecb1f58af6e091a65276f986d'
            '31185f54427a0b14a4992672477fe2ae79aefd408c92ded1f3730bed55af4649'
            'c4e0e43fc23d9e3da36eb0245c52e60ac893ecb86e0617bac999cc38adfd337b'
            'a15f3aa3e7bc0fbaaa8da4f84beaecef06446e06bf42a8000e354e39ac6effe4')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/0001-change-Exec-value-in-.desktop-file-to-match-archlinu.patch"
	patch -p1 -i "$srcdir/0001-Change-instalation-path-to-be-Arch-linux-friendly.patch"
	patch -p1 -i "$srcdir/0001-disable-version-check.patch"
}

build() {
	cd "$pkgname-$pkgver/src"
	qmake PREFIX=/usr
	make
}

check() {
	cd "$pkgname-$pkgver/src"
	make -k check
}

package() {
	cd "$pkgname-$pkgver/src"
	INSTALL_ROOT="$pkgdir" make DESTDIR="$pkgdir/" install
}
