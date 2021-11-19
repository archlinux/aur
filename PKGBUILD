# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=lswt
pkgver=1.0.1
pkgrel=2
pkgdesc="List Wayland toplevels"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/lswt"
license=('GPL3')
provides=("lswt")
source=("https://git.sr.ht/~leon_plickat/lswt/archive/v1.0.1.tar.gz"
        "makefile.patch")
sha256sums=('0303f81d46c53e1932b007b95351d21ad6d7c0cdeed6a837ae122f34d0b53be7'
            '0c7277485520d40e54099ee9d91336ad13dbf0809cbffe81a337de7f58aad032')

prepare() {
    cd "$pkgname-v$pkgver"
    patch --forward --strip=1 --input="${srcdir}/makefile.patch"
}

build() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
