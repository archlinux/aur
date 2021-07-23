# Maintainer: suliman altassan <suliman.p2019@gmail.com>

pkgname=alif-git
pkgdesc="The Alif Arabic Programming Language - لغة البرمجة العربية ألف"
pkgver=r94.5975e21
pkgrel=1
arch=('x86_64')
url="https://www.aliflang.org/"
license=('GPL3')
depends=('boost')
makedepends=('boost' 'cmake' 'git')
optdepends=('webui-git: to use web browsers as UI')
conflicts=('alif')
provides=('alif')
source=("$pkgname"::"git+https://github.com/alifcommunity/compiler.git")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname
    mkdir -p build 
    cd build
    cmake .. . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/local
    make
}

package() {
    cd $srcdir/$pkgname
    cd build
    make install
}
