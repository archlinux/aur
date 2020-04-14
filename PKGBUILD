# Maintainer: DuckSoft <realducksoft at gmail dot com>
pkgname=rime-xkjd6-ducksoft-git
pkgver=1.0
pkgrel=1
pkgdesc='星空键道6 for Rime (DuckSoft 调教版)'
arch=('x86_64')
url='https://github.com/DuckSoft/rime-jd6-ducksoft'
provides=('rime-xkjd6')
conflicts=('rime-xkjd6')
license=('GPL3')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "%s" $(git describe --long --tags | sed 's/v//;s/-\S*//g')
}

prepare() {
    cd $pkgname
    for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
    cd $pkgname
    rime_deployer --compile xkjd6.schema.yaml
}

package() {
    cd $pkgname
    find . -type l -delete
    rm build/*.txt
    install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
    install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
