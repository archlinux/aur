# Maintainer: LoaD Accumulator <lda@freetards.xyz>
pkgname=cytoplasm-git
pkgver=0.4.0
pkgrel=6
pkgdesc="The Telodendria core library"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.telodendria.io/Telodendria/Cytoplasm"
license=('Telodendria')
depends=('openssl')
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
        # By default, it uses the c99 compiler instead of cc?????
        export CC=cc
        ./configure --prefix=$pkgdir/usr --no-static
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir/" install
}
