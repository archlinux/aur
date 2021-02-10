# Maintainer: Luna Nieves <aicaya@posteo.net>

pkgname=q5go
pkgver=2.0
pkgrel=2
pkgdesc="SGF editor and IGS client for Go players"
arch=('x86_64')
url='https://github.com/bernds/q5Go'
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg')
optdepends=('pandoc: make dependency, add README to menu options')
source=("https://github.com/bernds/q5Go/archive/q5go-$pkgver.tar.gz"
        "q5go.desktop")
sha256sums=('993777c02fbab136c12f9de2bc27178edfd10c070d57cf1dd7151b676c6b8a90'
            '11c3490e0dd8613465672f4b74b19ee2329944618f566e908d0b0936064f8a69')

build() {
    mkdir build && cd build
    qmake-qt5 "../q5Go-$pkgname-$pkgver/src/q5go.pro" PREFIX=/usr
    make
}

package() {
    cd build
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
