# Maintainer: Richard Bradfield <bradfier at fstab dot me>

pkgname=rhack
pkgver=0.1.0
pkgrel=2
pinref="30c6a8fac53c83db6a594a29d10dc0209e955a9a"
pkgdesc="rhack - easily hack on your Rust dependencies" 
url="https://github.com/nakabonne/rhack"
depends=("gcc-libs")
makedepends=("cargo" "git")
provides=("rhack")
arch=("i686" "x86_64")
license=("BSD")
source=("https://github.com/nakabonne/rhack/archive/$pinref.zip")
sha512sums=('867bf838d5b5ccc01b934dc9ecedc77a50b5902cb07b6e391a2cbca051c7824d8134a45246334d72e9662f11429556c52242c5dbb04b41400e96e3431400844d')

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
