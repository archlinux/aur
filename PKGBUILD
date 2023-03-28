# Maintainer: Christian Heusel <christian@heusel.eu>

pkgname=pawxel-git
_pkgname=${pkgname%-git}
pkgver=0.1.2.r24.ge71c769
pkgrel=1
pkgdesc='Lightweight screenshot tool for designers & developers'
arch=('x86_64')
url='https://pawxel.rocks/'
license=('GPL3')
makedepends=('git')
depends=('qt5-base' 'qt5-x11extras' 'gtk3' 'libxcb' 'libx11' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/yeahitsjan/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"

    git submodule update --init
}

build() {
    cd "$_pkgname"

    qmake
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
