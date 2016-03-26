# Maintainer: Iblis Lin <e196819@hotmail.com>

pkgname=pillowtalk-git
pkgver=0.3.r29.ga2323dc
pkgrel=1
pkgdesc="ANSI C library that talks to CouchDB using libcurl and yajl"
arch=('any')
url="https://github.com/mgmarino/pillowtalk"
license=('MIT')
depends=('curl' 'yajl')
makedepends=('git' 'cmake')
source=("$pkgname"::"git+https://github.com/mgmarino/pillowtalk.git")
md5sums=('SKIP')
options=('strip')

pkgver() {
    cd $srcdir/$pkgname

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd $srcdir/$pkgname

    make DESTDIR="$pkgdir/" install
}
