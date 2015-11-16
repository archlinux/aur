# Maintainer: aggraef@gmail.com
pkgname=libmusicxml-git
pkgver=34.68feb19
pkgrel=1
pkgdesc="library and tools for the MusicXML format (git version)"
arch=('x86_64' 'i686')
url="https://github.com/dfober/libmusicxml"
license=('LGPL')
makedepends=('cmake')
provides=('libmusicxml')
conflicts=('libmusicxml')
source=("$pkgname::git+https://github.com/dfober/libmusicxml")
md5sums=('SKIP')

pkgver() {
    cd $srcdir/$pkgname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname/cmake"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -G "Unix Makefiles"
    make
}

package() {
    cd "$srcdir/$pkgname/cmake"
    make install DESTDIR="$pkgdir"
}
