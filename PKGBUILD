#Maintainer: Sam Bazley <sambazley@fastmail.com>
pkgname=ujson-git
pkgver=20200614025758
pkgrel=1
pkgdesc="Json library written in C"
arch=("i686" "x86_64")
url="https://gitlab.com/Niflheimr/ujson"
license=("ZLIB")
makedepends=("cmake")
depends=()
source=("git+https://gitlab.com/Niflheimr/ujson.git")
md5sums=("SKIP")

pkgver() {
    cd ujson
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "$srcdir/ujson"
    make
}

package() {
    cd ujson
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
