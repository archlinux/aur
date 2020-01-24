# Maintainer: Tiago Gonçalves <ogait87@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
pkgname=pic32prog-git
_gitname="${pkgname%-git}"
_gitbranch='master'
_gitauthor='sergev'
pkgver=2.0.241
pkgrel=2
arch=('x86_64')
pkgdesc="Flash programming utility for Microchip PIC32 microcontrollers"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
depends=('libusb')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/${_gitauthor}/${_gitname}.git"
        "${pkgname%-git}.patch")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "2.0.$(git rev-list HEAD --count)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -D -s pic32prog "$pkgdir/usr/bin/pic32prog"
}

# vim:set et sw=4 sts=4 tw=80:
