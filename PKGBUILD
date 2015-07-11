# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=maim-git
_realname=maim
pkgver=v3.4.43.r0.g2e5ed5b
pkgrel=1
conflicts=( 'maim' )
pkgdesc="maim (make image) makes an image out of the given area on the given X screen. Defaults to the whole screen."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$_realname"
license=( 'GPL3' )
depends=( 'bzip2' 'freetype2' 'glibc' 'imlib2' 'libx11' 'libxext' 'zlib' )
optdepends=( 'slop-git: for selection support' )
makedepends=( 'make' 'gcc' 'cmake' )
source=( "maim::git+https://github.com/naelstrof/maim.git" )
md5sums=('SKIP')

pkgver() {
    cd "$_realname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_realname"
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" ./
    make
}

package() {
    cd "$srcdir/$_realname"

    make install
}
