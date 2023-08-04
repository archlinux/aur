# Maintainer: Samuel Corsi-House <chouse.samuel@gmail.com>
_gitname=swaylock-effects-improved
pkgname="$_gitname-git"
pkgver=fe5f7c4
pkgrel=1
pkgdesc="A fancier screen locker for Wayland."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Xenfo/$_gitname"
license=('MIT')
depends=('libxkbcommon' 'cairo' 'gdk-pixbuf2' 'pam' 'wayland')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland-protocols')
provides=('swaylock' 'swaylock-effects')
conflicts=('swaylock')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_gitname"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "$srcdir/$_gitname"
	DESTDIR="$pkgdir" ninja -C build install
}
