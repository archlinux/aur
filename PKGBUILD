# Maintainer: Justin Coffman <jcoffman@stellarwind.io>
# Contributor: Matthew Longley <randomticktock@gmail.com>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=5
arch=('i686' 'x86_64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net/"
license=('GPL3')
makedepends=(
    'git'
)
depends=(
    'pcre'
    'openssl'
)
conflicts=(
    'tinyfugue-git'
    'tinyfugue-patched'
)
source=("git+https://github.com/eigenfire/tinyfugue.git#tag=v$pkgver-$pkgrel")
sha256sums=('SKIP')

# build function
build() {
    cd "$srcdir/tinyfugue"

    ./configure --prefix=/usr
    make
}

# package function
package() {
    cd "$srcdir/tinyfugue"

    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -d "$pkgdir/usr/share/man/man1"
    install -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
