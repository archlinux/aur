# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=slop-git
_realname=slop
pkgver=v4.2.19.r0.ga8f1e5c
pkgrel=1
conflicts=( 'slop' )
pkgdesc="slop (Select Operation) is an application that queries for a selection from the user and prints the region to stdout."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$_realname"
license=( 'GPL3' )
depends=( 'libxext' 'libx11' 'imlib2' 'mesa' 'glew' 'libxrender' )
makedepends=( 'make' 'cmake' 'glm' )
source=( "slop::git+https://github.com/naelstrof/slop.git" )
md5sums=('SKIP')

pkgver() {
    cd "$_realname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_realname"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_OPENGL_SUPPORT=true ./
    make
}

package() {
    cd "$srcdir/$_realname"

    make install
}
