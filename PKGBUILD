pkgname=rar2fs
pkgver=1.24.0
pkgrel=1
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

source=(    "https://github.com/hasse69/rar2fs/releases/download/v$pkgver/rar2fs-$pkgver.tar.gz"
            "http://www.rarlab.com/rar/unrarsrc-5.4.5.tar.gz")
sha256sums=('5d702847071fbbc6fe25d14b544f390f7e65ad3d13c14a619dbf7c290e65edae'
            'e470c584332422893fb52e049f2cbd99e24dc6c6da971008b4e2ae4284f8796c')
            
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}

