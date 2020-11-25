# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=pastenotifier-git
pkgver=26.985ca75
pkgrel=1
pkgdesc="Simple application showing what is copied to the clipboard, avoids embarassment"
arch=(i686 x86_64)
url="https://github.com/sandsmark/pastenotifier"
license=(GPL3)
depends=(kglobalaccel)
makedepends=(git)
provides=(pastenotifier)
conflicts=(pastenotifier)
source=('git+https://github.com/sandsmark/pastenotifier.git')
md5sums=('SKIP')

pkgver() {
    cd pastenotifier
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
        cmake ../pastenotifier \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
