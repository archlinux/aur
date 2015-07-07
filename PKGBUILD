# vim:ts=4:sw=4:expandtab
# unclutter-xfixes -- rewrite of unclutter using the x11-xfixes extension.
pkgname=unclutter-xfixes-git
pkgver=r19.b8d08ab
pkgrel=1
pkgdesc='unclutter-xfixes is a rewrite of unclutter using the x11-xfixes extension.'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/unclutter-xfixes'
license=('MIT')
provides=('unclutter')
conflicts=('unclutter' 'unclutter-patched')
#groups=
depends=('libxi' 'libx11' 'libxfixes' 'libev')
makedepends=('git' 'asciidoc')
source=('git://github.com/Airblader/unclutter-xfixes#branch=master')
sha1sums=('SKIP')

_gitname='unclutter-xfixes'

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    make all
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
