# Maintainer: Alex Forencich <alex@alexforencich.com>
# Contributor: firstvirus92 <dev[at]firstvirus92[dot]de>
pkgname=openra-bleed
pkgver=r18036.2f759ab
pkgrel=1
pkgdesc="An open-source implementation of the Red Alert engine using .NET/mono and OpenGL (git version)"
arch=("any")
url="http://openra.net"
license=("GPL3")
depends=("mono" "ttf-dejavu" "openal" "libgl" "freetype2" "sdl2" "lua51" "hicolor-icon-theme" "desktop-file-utils" "xdg-utils" "zenity")
makedepends=("git")
provides=("openra" "openra-dedicated-bleed")
conflicts=("openra" "openra-dedicated-bleed")
install=openra-bleed.install
source=("$pkgname-src::git+https://github.com/OpenRA/OpenRA.git#branch=bleed")
sha512sums=("SKIP")

pkgver() {
    cd "$srcdir/$pkgname-src"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname-src"
    make version
    make dependencies
    make all
}

package() {
    cd "$srcdir/$pkgname-src"
    make prefix=/usr DESTDIR="$pkgdir" install-all
    make prefix=/usr DESTDIR="$pkgdir" install-linux-shortcuts
}
