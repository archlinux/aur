# vim:ts=4:sw=4:expandtab
# xedgewarp -- window manager agnostic pointer warping between outputs
pkgname=xedgewarp-git
pkgver=v1.1.r1.g1695e18
pkgrel=1
pkgdesc='xedgewarp is a window manager agnostic tool for pointer warping between outputs'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/xedgewarp'
license=('MIT')
provides=('xedgewarp')
#conflicts=
#groups=
depends=('libxcb' 'xcb-util' 'libxi' 'libx11' 'libxrandr' 'libxfixes')
makedepends=('git' 'asciidoc')
source=('git://github.com/Airblader/xedgewarp#branch=master')
sha1sums=('SKIP')

_gitname='xedgewarp'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    make PREFIX=/usr all
}

package() {
    cd "$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
