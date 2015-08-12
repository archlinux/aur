pkgname=rar2fs
pkgver=1.20.0
pkgrel=5
pkgdesc="Fuse file system for reading Rar archives"
arch=("i686" "x86_64")
license=("GPL3")
url="https://hasse69.github.io/rar2fs/"

# The "rar2fs" program loads the "libunrar" library at run time
# using the exact version (5.m.n) installed at build time.
# Also, the "libunrar" source code that "rar2fs" is built with
# should probably be the same version that is installed.
depends=("fuse" "libunrar")
makedepends=("libunrar")

source=(    "https://github.com/hasse69/rar2fs/releases/download/v1.20.0/rar2fs-1.20.0.tar.gz"
            "http://www.rarlab.com/rar/unrarsrc-5.2.7.tar.gz")
sha256sums=('2b14cc5acefa12a07f5d0b1a4241713707e60e32f7a82cd86879ec1bd9cbae2d'
            'ef14757e943787b439fedf2c564c1f38d0db315528a928e0de170860717e2fac')
            
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}

