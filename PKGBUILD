# Maintainer : vic.pozd <vic.pozd at gmail.com>

pkgname=cqrtest-git
_gitname=cqrtest
pkgver=0.0.0
pkgrel=1
pkgdesc="CQRTest - Linux contest log (git version)"
arch=('i686' 'x86_64')
url="http://cqrtest.com/"
license=('GPL')
depends=('mariadb' 'libmariadbclient' 'hamlib')
makedepends=('git' 'lazarus')
source=('git://github.com/ok2cqr/cqrtest.git')
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    git describe --always | sed 's|-|.|g'
}

build() {
    cd $_gitname
    sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
    sed -i '22i\\tinstall -d -v         $(sharedir)/applications' Makefile
    sed -i '22i\\tinstall -d -v         $(sharedir)/icons' Makefile
    make
}

package() {
    cd $_gitname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
