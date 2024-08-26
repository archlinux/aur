# Maintainer: LoaD Accumulator <lda@ari.lt>
pkgname=cytoplasm-git
pkgver=0.4.1.r51.gf5ce4f5
pkgrel=2
pkgdesc="The Telodendria core library"
arch=('any')
url="https://git.telodendria.io/Telodendria/Cytoplasm"
license=('Telodendria')
depends=('openssl' 'lmdb')
makedepends=('git')
provides=('cytoplasm')
source=($pkgname::git+https://git.telodendria.io/Telodendria/Cytoplasm.git)
validpgpkeys=()
md5sums=("SKIP")

prepare() {
        cd "$pkgname"
}

pkgver() {
        cd "$pkgname"
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd "$pkgname"
        ./configure --prefix=$pkgdir/usr --with-lmdb
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir/" install
}
