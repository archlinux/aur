# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=jome-git
pkgver=r119.409e2fc8
pkgrel=1
pkgdesc='Jome is a keyboard centric emoji picker desktop application.'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'boost')
url='https://github.com/eepp/jome'
source=('jome-git::git+https://github.com/eepp/jome')
md5sums=('SKIP')
options=()

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

build() {
    mkdir -p $srcdir/$pkgname/build
    cd $srcdir/$pkgname/build

    cmake -DCMAKE_BUILD_TYPE=release ..
    make
}

package() {
    cd $srcdir/$pkgname/build

    make DESTDIR=$pkgdir install
}
