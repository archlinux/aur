pkgname=libyuarel-git
pkgver=1.0.r20.g463760f
pkgrel=1
pkgdesc='Simple C library for parsing URLs with zero-copy and no mallocs'
arch=(x86_64)
url='https://github.com/jacketizer/libyuarel'
license=(MIT)
depends=('glibc')
makedepends=('git' 'sed')
provides=(libyuarel)
conflicts=(libyuarel)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd libyuarel
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd libyuarel
    sed -i "s/ln -fs/ln -frs/" Makefile
}

build () {
    cd libyuarel
    make
}

package () {
    cd libyuarel

    make PREFIX="$pkgdir/usr" install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/libyuarel-git/" LICENSE
}
