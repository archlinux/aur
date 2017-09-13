# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=slop-git
_realname=slop
pkgver=v7.3.49.r1.gd7c12dd
pkgrel=2
conflicts=( 'slop' )
provides=( 'slop' )
pkgdesc="slop (Select Operation) is an application that queries for a selection from the user and prints the region to stdout."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$_realname"
license=( 'GPL3' )
depends=( 'libxext' 'libx11' 'mesa' 'libxrender' )
makedepends=( 'make' 'cmake' 'glm' )
source=( "slop::git+https://github.com/naelstrof/slop.git" )
md5sums=('SKIP')

pkgver() {
    cd "$_realname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_realname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ./
    make
}

package() {
    cd "$srcdir/$_realname"
    make DESTDIR="$pkgdir" install
}
