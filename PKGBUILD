# Maintainer: Luna Nieves <aicaya@posteo.net>

pkgname=q5go
pkgrel=1
pkgver=2.0
pkgdesc="SGF editor and IGS client for Go players"
arch=('x86_64')
url='https://github.com/bernds/q5Go'
license=('GPL')
depends=('qt5-multimedia' 'qt5-svg')
makedepends=('git')
optdepends=('pandoc: make dependency, add README to menu options')
source=("https://github.com/bernds/q5Go/archive/q5go-$pkgver.tar.gz"
        "q5go.desktop")
md5sums=('8bc389d50f5caa7e10dd45de81c3649a'
         'fa547fb8a61c4a7079222a1123185093')

build() {
    mkdir "q5Go-$pkgname-$pkgver/build"
    cd "q5Go-$pkgname-$pkgver/build"
    qmake-qt5 ../src/q5go.pro PREFIX=/usr
    make
}

package() {
    cd "q5Go-$pkgname-$pkgver/build"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}
