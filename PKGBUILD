# Maintainer: naelstrof <naelstrof@gmail.com>
pkgname=maim-git
_realname=maim
pkgver=v4.4.50.r0.g129bf5b
pkgrel=1
provides=( 'maim' )
conflicts=( 'maim' )
pkgdesc="maim (make image) makes an image out of the given area on the given X screen. Defaults to the whole screen."
arch=( 'i686' 'x86_64' )
url="https://github.com/naelstrof/$_realname"
license=( 'GPL3' )
depends=( 'slop-git' 'bzip2' 'freetype2' 'glibc' 'libpng' 'libjpeg-turbo' 'libx11' 'libxext' 'zlib' )
makedepends=( 'cmake' 'glm' )
source=( "maim::git+https://github.com/naelstrof/maim.git" )
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
