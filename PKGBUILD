pkgname=minisat-git
pkgver=2.2.0.r303.37dc6c6
pkgrel=1
pkgdesc='A minimalistic and high-performance SAT solver'
arch=('i686' 'x86_64')
url="http://minisat.se/"
license=('MIT')
makedepends=('git' 'cmake')
_gitname=minisat
source=($_gitname::git+https://github.com/niklasso/minisat.git)
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    printf '2.2.0.r%s.%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_gitname}"

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../
    make
}

package() {
    cd "${srcdir}/${_gitname}"

    cd build
    make DESTDIR="$pkgdir/" install
}
