# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.9.3.1
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
sha256sums=('8dcee2fb9ae5e512b1ac0109ae468d3a65ab018b1c51c2d7db6f6758c6b9bf12')
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
