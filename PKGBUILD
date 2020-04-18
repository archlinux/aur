# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=rime-xhux-ducksoft-git
pkgver=1.0
pkgrel=1
pkgdesc="小鹤双形 音形输入方案 (DuckSoft 魔改版)"
arch=('x86_64')
url='https://github.com/DuckSoft/rime-xhux-ducksoft'
source=("$pkgname::git+$url")
license=(custom)
provides=('rime-xhux')
conflicts=('rime-xhux')
makedepends=('rime-prelude' 'librime')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "%s" $(git describe --long --tags | sed 's/v//;s/-\S*//g')
}

prepare() {
    cd $pkgname
    for _f in $(pacman -Qql rime-prelude | grep -v "/$"); do ln -sf $_f; done
}

build() {
    cd $pkgname
    rime_deployer --compile xhux.schema.yaml
}

package() {
    cd $pkgname
    rm build/*.txt
    install -Dm644 xhux.schema.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
