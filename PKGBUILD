# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname='aqsis-git'
pkgdesc='A Pixar RenderMan-compliant REYES renderer'
pkgver=20250822.937ead9a
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/aqsis/aqsis'

depends=('libtiff' 'flex' 'bison' 'zlib' 'libjpeg-turbo' 'openexr')
makedepends=('boost' 'git' 'cmake')
source=('git+https://github.com/aqsis/aqsis.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/aqsis"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
    cd "$srcdir/aqsis"
    git submodule update --init
}

build() {
    mkdir -pv "$srcdir/build"
    cd "$srcdir/build"
    cmake ../aqsis -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/build" || exit 1
    make DESTDIR="${pkgdir}" install
}

