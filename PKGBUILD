# Maintainer: Zenn <mine.minefis@gmail.com>
pkgname=wl_shimeji-git
_pkgname=wl_shimeji
pkgver=0.0.1.r0.9690835
pkgrel=1
pkgdesc="Shimeji reimplementation for Wayland in C"
arch=('x86_64')
url="https://github.com/CluelessCatBurger/wl_shimeji"
license=('GPL-2.0')
depends=('python' 'wayland' 'wayland-protocols' 'wlr-protocols' 'libspng')
makedepends=('make' 'gcc' 'git')
source=("$_pkgname::git+https://github.com/CluelessCatBurger/wl_shimeji.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
    unset CFLAGS
    CFLAGS+=" -O2 "
	cd "$srcdir/$_pkgname"
	make all PREFIX=/usr -j1
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
