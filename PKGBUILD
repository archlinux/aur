# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.9.0
pkgrel=3
pkgdesc="小鹤音形 rime 挂接文件"
arch=('x86_64')
url="http://flypy.com/"
license=('unknown')
makedepends=('librime' 'rime-prelude')
optdepends=('ibus-rime: input support'
            'fcitx-rime: input support'
            'fcitx5-rime: input support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cubercsl/rime-flypy/archive/v$pkgver.tar.gz")
sha256sums=('23e33511647e1dc112947c12e9d39840d30675733222c65a37510b923dccd177')
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
