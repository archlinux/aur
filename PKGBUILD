# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=sequeler-git
_gitname=sequeler
pkgver=03b81b4
pkgrel=1
pkgdesc="SQL Client built in Vala and GTK3"
arch=('i686' 'x86_64')
url="https://github.com/Alecaddd/sequeler"
license=('GPL3')
depends=('gtk3' 'vala' 'granite' 'libxml2' 'libgda' 'libgda-mysql' 'libgda-postgres' 'gtksourceview3')
makedepends=('git'
             'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/Alecaddd/sequeler.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/sequeler"
    git describe --always | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
    cd "${srcdir}/${_gitname}/"
    mkdir build/ && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    cd "${srcdir}/${_gitname}/"
    cd build
    make DESTDIR="$pkgdir" install
}
