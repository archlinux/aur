#Maintainer: Sam Bazley <sambazley@protonmail.com>
pkgname=ujson-git
pkgver=20181227185838
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

prepare() {
    cd "$srcdir/ujson"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/ujson"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
    make
}

package() {
    cd ujson
    make install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
