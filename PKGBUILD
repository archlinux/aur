#Maintainer: Sam Bazley <sambazley@fastmail.com>
pkgname=blockbar-wl-git
pkgver=20220713101001
pkgrel=1
pkgdesc="Blocks based status bar for Wayland (wlroots) compositors"
arch=("i686" "x86_64")
url="https://github.com/sambazley/blockbar"
license=("ZLIB")
makedepends=()
depends=("cairo" "pango" "ujson-git" "wayland" "wayland-protocols")
source=("git+https://github.com/sambazley/blockbar.git")
md5sums=("SKIP")
provides=("blockbar")
install=blockbar.install
conflicts=("blockbar-git")

pkgver() {
    cd blockbar
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "$srcdir/blockbar"
    make WAYLAND=1
}

package() {
    cd blockbar
    make WAYLAND=1 DESTDIR="$pkgdir" PREFIX=/usr install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
