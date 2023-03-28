# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel-git
pkgver=0.1.2.r18.gc7cabfb
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers '
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/yeahitsjan/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"

    git submodule update --init
}

build() {
    cd "$pkgname"

    qmake
    make
}

package() {
    cd "$pkgname"
    install -Dm755 ${pkgname%-git} $pkgdir/usr/bin/${pkgname%-git}
}
