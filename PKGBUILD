# Maintainer: Alfredo Luque <me@aluque.io>

pkgname='chrysalis-git'
pkgdesc='A graphical configuration tool for programmable keyboards. Git master'
pkgver=chrysalis.0.6.1.r2.g50fb61d
pkgrel=0
arch=('x86_64')
url='https://github.com/keyboardio/Chrysalis'
license=('GPL3')
depends=('yarn' 'npm' 'electron')
options=('!strip')
makedepends=('git')
source=('git+https://github.com/keyboardio/Chrysalis.git')
sha512sums=('SKIP')

pkgver() {
    cd Chrysalis
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/Chrysalis"
    mkdir -p $srcdir/usr
    npm install
    yarn build:linux
    cd dist
    mv *.AppImage chrysalis
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/Chrysalis/dist/chrysalis" "$pkgdir/usr/bin"
}
