# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=moGL
pkgname=mogl-git
pkgver=0.1.4.r0.g7c181fd
pkgrel=1
pkgdesc="Modern OpenGL wrapper, thin C++14 header-only layer on top of the OpenGL 4.5+ API"
arch=('i686' 'x86_64')
url="https://github.com/Ryp/moGL"
license=('MIT')
makedepends=('git' 'cmake')
conflicts=('mogl')
provides=('mogl')
source=('git+https://github.com/Ryp/moGL.git')
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
