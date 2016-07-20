# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=mdl-git
pkgver=r123.16f55e6
pkgrel=1
epoch=1
pkgdesc='MarkDown Less is a Markdown displayer (Git version)'
arch=('x86' 'x86_64')
url='http://github.com/dopsi/mdl'
license=('MIT')
provides=('mdl')
conflicts=('mdl')
depends=('boost-libs')
source=('git://github.com/dopsi/mdl#branch=features')
sha1sums=('SKIP')

_gitname=mdl

pkgver() {
    cd $_gitname
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$_gitname/build"
    make DESTDIR="$pkgdir" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:ts=4:sw=4:expandtab
