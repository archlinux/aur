# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
# Contributor: Martin Dørum <martid0311@gmail.com>
_gitname=swaylock-effects
pkgname="$_gitname-git"
pkgver=r402.9ac172a
pkgrel=1
pkgdesc="A fancier screen locker for Wayland."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jirutka/$_gitname"
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
