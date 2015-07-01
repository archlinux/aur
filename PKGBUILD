# Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
pkgname=colors-git
pkgver=0.3.r0.g554aa12
pkgrel=1
pkgdesc='Extract colors from an image.'
arch=('i686' 'x86_64')
url='http://git.2f30.org/colors/'
license=('custom:ISC')
provides=('colors')
depends=('libpng')
makedepends=('git')
source=('git://git.2f30.org/colors#branch=master')
sha1sums=('SKIP')

_gitname='colors'

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$_gitname"
    make CPPFLAGS=-I/usr/include all
}

package() {
    cd "$_gitname"
    make PREFIX=/usr MANPREFIX=/usr/share DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=4:sw=4:expandtab
