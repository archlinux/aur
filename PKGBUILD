#Maintainer: Sam Bazley <sambazley@protonmail.com>
pkgname=blockbar-git
pkgver=20180617002646
pkgrel=1
pkgdesc="Blocks based status bar for X window managers"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/blockbar"
makedepends=("cmake")
depends=("cairo" "pango" "xorg-xrandr")
source=("git+https://gitlab.com/sambazley/blockbar.git")
md5sums=("SKIP")

pkgver() {
    cd blockbar
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

prepare() {
    cd "$srcdir"/blockbar
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir"/blockbar
    cmake .
    make
}

package() {
    install -Dm755 blockbar/blockbar "$pkgdir"/usr/bin/blockbar
    install -Dm755 blockbar/bbc "$pkgdir"/usr/bin/bbc
}
