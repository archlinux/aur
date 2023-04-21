# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=nudoku
pkgver=2.1.0
pkgrel=3
pkgdesc="ncurses based sudoku game"
arch=('x86_64' 'aarch64')
url="https://jubalh.github.io/nudoku"
license=('GPL3')
depends=('ncurses' 'cairo')
makedepends=('autoconf')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jubalh/nudoku/archive/$pkgver.tar.gz"
    "patch.diff"
)
b2sums=('997ae3931fec3b6605858a35cdf6bc88296138c01a9138d229ed43a5262fdd5d15eb8a96dfdcf02e8eb6f7f416b84e4752edbb57319be50bfdae6c952217446b'
        '4b959df35c59b329cb6888af64bdb1cba3a28fa9420a8f94e4fdf5577b39daf9966edfe402399f6b80d410d7647363e76e3373cd086296b2c8cb6fa73fd43f56')

prepare() {
    patch -d"$pkgname-$pkgver" -N -p1 -i "$srcdir/patch.diff"
}

build() {
    cd "$pkgname-$pkgver"
    autoreconf -i
    ./configure --prefix=/usr --enable-cairo
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
