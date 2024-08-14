# Maintainer: fish4terrisa-MSDSM <flyingfish.msdsm@gmail.com>
pkgname=wayfire-firedecor-mntmn-git
pkgver=1.127.d4992ea
pkgrel=1
conflicts=('wayfire-firedecor-git')
pkgdesc="An advanced window decoration plugin for the wayfire window manager.Modified by mntmn to add newer wayfire API support."
arch=('any')
url="https://github.com/mntmn/wayfire-firedecor.git"
license=('MIT')
depends=('wayfire-git' 'librsvg' 'boost')
makedepends=('git' 'meson' 'ninja' 'cmake')
provides=('wayfire-firedecor-git' 'wayfire-firedecor')
source=('git+https://github.com/mntmn/Firedecor.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Firedecor"
    printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Firedecor"
    	arch-meson . build
	meson compile -C build
}

package() {
    cd "$srcdir/Firedecor/build"
    	chmod +rwx "$srcdir/Firedecor/build/meson-logs/" 
	DESTDIR="${pkgdir}" meson install -C ../build 
}
