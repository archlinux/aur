# Maintainer: cubercsl <2014cais01 at gmail dot com>

pkgname=rime-flypy
pkgver=10.9.2
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
sha256sums=('00363e46c95b423e5161cdf7c82b3649a988b83c4ce39a449336a0ebabcbd9b8')
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
