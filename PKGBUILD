# Maintainer: Luna Nieves <aicaya@posteo.net>

pkgname=q5go
pkgver=2.1.2
pkgrel=1
pkgdesc="SGF editor and IGS client for the game of Go"
arch=('x86_64')
url='https://github.com/bernds/q5Go'
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg')
optdepends=('pandoc: make dependency, add README to menu options')
source=("https://github.com/bernds/q5Go/archive/q5go-$pkgver.tar.gz"
        "q5go.desktop")
sha256sums=('00a685eed2bb4318ce148e916248def63ac484dda6eb8b3cda501a526e215d67'
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
