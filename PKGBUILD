# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=bebop-stream-vlc-git
pkgver=r1.5fd43c3
pkgrel=1
pkgdesc="Open Parrot Bebop video stream with any video player"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsdk3-git)
optdepends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('application_notes::git+https://github.com/Parrot-Developers/application_notes'
        '0001-Use_system_arsdk.patch'
        'LICENSE')
sha256sums=('SKIP'
            '9e03f69ae6c41554c60d20738d0bfef391492a386d6ea04f95449e0bcd05842b'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/application_notes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir"

	# Patch Makefile
	patch -p1 -i "$srcdir/0001-Use_system_arsdk.patch"
}

build() {
	cd "$srcdir/application_notes/BebopStreamVLC"
	make
}

package() {
	# Copy binary
	mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/application_notes/BebopStreamVLC/BebopDroneStartStream" "$pkgdir/usr/bin/BebopDroneStartStream"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
