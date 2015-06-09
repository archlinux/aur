# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=moGL
pkgname=mogl-devel-git
pkgver=0.1.4.r5.g01ff787
pkgrel=1
pkgdesc="Modern OpenGL wrapper, develop branch"
arch=('i686' 'x86_64')
url="https://github.com/Ryp/moGL"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=('mogl')
provides=('mogl')
source=('git+https://github.com/Ryp/moGL.git#branch=develop')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    mkdir -p build &&  pushd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "$srcdir/$_gitname/build"
    make install DESTDIR="$pkgdir"
}
