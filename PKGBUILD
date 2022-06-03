# Maintainer: so1ar <so1ar114514@gmail.com>

pkgname=rime-symbols-git
pkgver=20220603.r4.ce9c2b9
pkgrel=3
pkgdesc="Chinese to symbols support for rime"
arch=('any')
url="https://github.com/so1ar/rime-symbols"
license=('LGPL')
provides=('rime-symbols')
conflicts=('rime-symbols')
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir"/rime-symbols
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

prepare() {
  cd rime-symbols
  ./rime-symbols-gen
}

package() {
  cd rime-symbols
  install -Dm644 *.{json,txt} -t "$pkgdir"/usr/share/rime-data/opencc/
}


