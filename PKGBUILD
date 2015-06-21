# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=keyfinder-cli-git
pkgdesc="A DJ friendly tool for estimating the musical key of an audio file"
license=('GPL3')
url="https://github.com/EvanPurkhiser/keyfinder-cli"
pkgver=39.e8a20e7
pkgrel=1

source=("$pkgname::git://github.com/EvanPurkhiser/keyfinder-cli")
md5sums=('SKIP')
depends=('libkeyfinder-git' 'ffmpeg')
makedepends=('git' 'boost')
arch=('i686' 'x86_64')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"

    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
