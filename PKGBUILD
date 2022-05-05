# Maintainer: Luna Nieves <aicaya@posteo.net>

pkgname=q5go
pkgver=2.1.3
pkgrel=1
pkgdesc="SGF editor and IGS client for the game of Go"
arch=('x86_64')
url='https://github.com/bernds/q5Go'
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg')
optdepends=('pandoc: make dependency, add README to menu options')
source=("https://github.com/bernds/q5Go/archive/q5go-$pkgver.tar.gz"
        "q5go.desktop")
sha256sums=('bffab6641acedf20b73f3429c60ef560942ffea27527aaa3a9a9c722b41f0791'
            'fd7c9d277d3a79ac95604751b0d03d7696d6e500229bbbcd3a145328661d5325')

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
