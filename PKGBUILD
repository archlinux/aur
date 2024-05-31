# Maintainer: Chris Mounce <christophermounce@gmail.com>

pkgname=decker
pkgver=1.43
pkgrel=1
pkgdesc="Multimedia platform for creating interactive documents"
arch=('x86_64')
url="http://beyondloom.com/decker/"
license=('MIT')
makedepends=('xxd')
depends=('glibc' 'sdl2' 'sdl2_image')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JohnEarnest/Decker/archive/refs/tags/v1.43.tar.gz")
sha256sums=('ba94013e0d28ff7b63a9821dd15575f35d6ab946771d674d55fc93dcb2f7b075')

build() {
    cd "$srcdir/Decker-$pkgver"
    make EXTRA_FLAGS='-Wl,-z,now,-z,shstk' decker lilt
}

package() {
    cd "$srcdir/Decker-$pkgver"
    DESTDIR="$pkgdir" PREFIX="/usr" make install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
