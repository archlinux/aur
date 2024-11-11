# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

pkgname=libgraph
pkgver=1.0.2
pkgrel=4
pkgdesc="Lib Graphics — Turbo C's graphics.h on Linux"
arch=('x86_64')
url="https://savannah.nongnu.org/projects/libgraph"
license=('GPL-2.0-or-later')
depends=('sdl' 'sdl_image' 'guile1.8')
source=("https://download.savannah.gnu.org/releases/libgraph/$pkgname-$pkgver.tar.gz")
md5sums=('6093bf0a9a65a5b873836276c9954194')
options=('!buildflags')

build() {
    cd "$pkgname-$pkgver"
    CFLAGS="$CFLAGS -fcommon -Wno-implicit-function-declaration "
    CFLAGS="$CFLAGS -Wno-incompatible-pointer-types -Wno-unused-result"
    ./configure --prefix=/usr
    make --jobs=1
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
