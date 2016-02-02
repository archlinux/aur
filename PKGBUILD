pkgname=rar2fs
pkgver=1.22.0
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
            "http://www.rarlab.com/rar/unrarsrc-5.3.4.tar.gz")
sha256sums=('02faa8f367cf17d297e27d835c5ef969106d51c285cb87a84244c69cf8fe2620'
            'ce4767b8532f0866c609ec99a0b4d21a2f6cb8a786b15092ddf608ec4904b874')
            
build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --with-unrar=../unrar
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}

