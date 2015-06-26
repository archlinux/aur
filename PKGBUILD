# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=aseprite-git
pkgver=r2497.bd3fcd3
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url='http://www.aseprite.org/'
license=('GPL')
depends=('allegro')
conflicts=('aseprite')
provides=('aseprite')
makedepends=('cmake' 'git')
source=("$pkgname::git+https://github.com/aseprite/aseprite.git"
"aseprite.desktop")
sha256sums=('SKIP'
'c9e624b9fd095ebb3eec8220a58d4a9422f39d68477bafcc0047d773814ba0aa')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    cmake -DCMAKE_INSTALL_PREFIX:STRING=/usr .
    make aseprite
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir/" install/fast
    install -Dm644 "$srcdir/aseprite.desktop" \
        "$pkgdir/usr/share/applications/aseprite.desktop"
    install -Dm644 "data/icons/ase48.png" \
        "$pkgdir/usr/share/pixmaps/aseprite.png"
}

# vim:set ts=2 sw=2 et:

