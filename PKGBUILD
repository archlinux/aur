# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.45
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v$pkgver.tar.gz"
        'decker.desktop'
        'application-x-decker.xml')
sha256sums=('a332324ffabb8cc26646592c66f1767967e90973d7a6f5a03b527db5b148b17b'
            'd03fc6cefd943d5220b187099f8318f79416b4eea757d26f07fcafb2e917202e'
            '8e73659f80d6aefab6bfde799aec504f4406ed279e3c1e2076cc3715f7ee7dfb')

build() {
    cd "$srcdir/Decker-$pkgver"
    make EXTRA_FLAGS='-Wl,-z,now,-z,shstk' decker lilt
}

package() {
    cd "$srcdir/Decker-$pkgver"
    DESTDIR="$pkgdir" PREFIX="/usr" make install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Install desktop entry with icon
    install -Dm644 "$startdir/decker.desktop" "$pkgdir/usr/share/applications/decker.desktop"
    install -Dm644 icon_32x32.png "$pkgdir/usr/share/pixmaps/decker.png"

    # Install MIME type
    install -Dm644 "$startdir/application-x-decker.xml" "$pkgdir/usr/share/mime/packages/application-x-decker.xml"
}
