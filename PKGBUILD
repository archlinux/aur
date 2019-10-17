#Maintainer: Sam Bazley <sambazley@fastmail.com>
pkgname=blockbar-git
pkgver=20191017234655
pkgrel=1
pkgdesc="Blocks based status bar for X window managers"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/blockbar"
license=("ZLIB")
makedepends=()
depends=("cairo" "pango" "libxrandr" "ujson-git")
source=("git+https://gitlab.com/sambazley/blockbar.git")
md5sums=("SKIP")
provides=("blockbar")
install=blockbar.install

pkgver() {
    cd blockbar
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "$srcdir/blockbar"
    make
}

package() {
    cd blockbar
    make DESTDIR="$pkgdir" PREFIX=/usr install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
