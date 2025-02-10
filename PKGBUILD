# Maintainer: Zenn <mine.minefis@gmail.com>
pkgname=wl_shimeji-git
_pkgname=wl_shimeji
pkgver=0.0.1.r103.2ca9a32
pkgrel=1
pkgdesc="Shimeji reimplementation for Wayland in C"
arch=('x86_64')
url="https://github.com/CluelessCatBurger/wl_shimeji"
license=('GPL-2.0')
depends=('python' 'wayland' 'wayland-protocols' 'python-pillow')
makedepends=('make' 'gcc' 'git')
source=("$_pkgname::git+https://github.com/CluelessCatBurger/wl_shimeji.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "0.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
    unset CFLAGS
    CFLAGS+=" -O2 "
    cd "$srcdir/$_pkgname"
    make all
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
    make DESTDIR="$pkgdir/" PREFIX=/usr install_plugins
}
