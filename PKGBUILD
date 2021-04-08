# Maintainer: Richard Bradfield <bradfier at fstab dot me>

pkgname=rhack
pkgver=0.1.0
pkgrel=3
pinref="5381a730c58652642a0e8eaabca9abf21cbb542d"
pkgdesc="rhack - easily hack on your Rust dependencies" 
url="https://github.com/nakabonne/rhack"
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("rhack")
arch=("i686" "x86_64")
license=("BSD")
source=("https://github.com/nakabonne/rhack/archive/$pinref.zip")
sha512sums=('cd5e030803f44bdf5080d0d5b76c56cc85bb2d109155d2f17d17a986bf68b7a67e66188d03c3978119c34750b0c6c217b36d165088d6acd7fc987a30b9134a61')

build() {
    cd rhack-$pinref
    make PREFIX=/usr
}

check() {
    cd rhack-$pinref
    make PREFIX=/usr test
}

package() {
    cd rhack-$pinref
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/rhack/LICENSE"
}
