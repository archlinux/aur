# Maintainer: Darvin Delgado <dnmodder@gmail.com>
pkgname=noods-git
pkgver=r574.b1fcf87
pkgrel=1
pkgdesc="A (hopefully!) speedy NDS emulator."
arch=('x86_64')
url="https://github.com/Hydr8gon/NooDS"
license=('GPL-3.0-or-later')
depends=('wxwidgets-gtk3' 'wxwidgets-common' 'alsa-lib' 'portaudio' 'libgl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("noods::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/usr" install
}
