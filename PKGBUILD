# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.44
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v$pkgver.tar.gz"
        'decker.desktop')
sha256sums=('8a92c0c8597d5af90fde5f99dc9d4928e1516869e5a09a4762739152d34e017d'
            '4ffc432f38a6dc53d8bc107ea5324c8e82546bb66dcf791c89f81cdd55768d4e')

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
}
