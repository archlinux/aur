# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.9.1
pkgrel=1
pkgdesc="小鹤音形 rime 挂接文件"
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
makedepends=('librime' 'rime-prelude')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('625c1d360ebb1b3320c40eb809764e376d25568652cc5867b0015f3bad929e2b')
install="$pkgname.install"

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr "DESTDIR=$pkgdir"
}

package() {
    depends=('rime-lua-hook')
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr "DESTDIR=$pkgdir" install
}
