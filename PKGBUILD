#Maintainer: Sam Bazley <sambazley@protonmail.com>
pkgname=blockbar-git
pkgver=20180618174439
pkgrel=1
pkgdesc="Blocks based status bar for X window managers"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/blockbar"
license=("ZLIB")
makedepends=("cmake")
depends=("cairo" "pango" "xorg-xrandr")
source=("git+https://gitlab.com/sambazley/blockbar.git")
md5sums=("SKIP")

pkgver() {
    cd blockbar
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

prepare() {
    cd "$srcdir/blockbar"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/blockbar"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
    make
}

package() {
    cd blockbar
    make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
