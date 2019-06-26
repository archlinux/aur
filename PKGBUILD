# Maintainer: Stanislav Nikitin <pztrn@pztrn.name>
# Contributor: Ezra Sharp <nicekiwi@gmail.com>

pkgname=webissues-client
pkgver=1.1.5
pkgrel=3
pkgdesc="An open source, multi-platform system for issue tracking and team collaboration."
arch=("x86_64")
url="http://webissues.mimec.org/"
license=("GPL3")
depends=("qt5-base>=5.6.2")
conflicts=("webissues")
provides=("webissues")
source=("https://github.com/mimecorg/webissues-client/archive/v1.1.5.tar.gz")
sha256sums=("7781b26ffefb6fcd05acc7d0b6a02ec237007496d85eb78b185701c245fca895")

build() {
    cd "$srcdir/$pkgname-$pkgver"

    patch --forward --strip=1 --input="../../remove-qpallete-from-issues-dialogs.patch"

    ./configure -prefix /usr -destdir "$pkgdir" -system-sqlite
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

