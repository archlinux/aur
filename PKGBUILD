# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=cyanrip-git
pkgver=r120.4180c61
pkgrel=1
pkgdesc="Bule-ish CD ripper"
arch=('i686' 'x86_64')
url="https://github.com/atomnuker/cyanrip"
license=('LGPL3')
depends=(libcdio
	libcdio-paranoia
	libdiscid
	libmusicbrainz5
	ffmpeg-git)
makedepends=(git meson)
provides=(cyanrip)
conflicts=(cyanrip)
source=("git+https://github.com/atomnuker/cyanrip.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson "${pkgname%-git}" build
	ninja -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
