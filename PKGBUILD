# Maintainer: loserMcloser <reebydobalina@gmail.com>

_gitname=waylogout
pkgname="$_gitname-git"
pkgver=r33.2ab8b21
pkgrel=1
pkgdesc="A lock/logout/suspend/reboot/poweroff dialog for Wayland."
arch=('x86_64')
url="https://github.com/loserMcloser/$_gitname"
license=('MIT')
depends=('libxkbcommon' 'cairo' 'gdk-pixbuf2' 'otf-font-awesome')
makedepends=('git' 'meson' 'ninja' 'scdoc' 'wayland' 'wayland-protocols')
source=("git+https://github.com/loserMcloser/$_gitname.git")
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
