# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=puzzlemoppet-git
pkgver=r59.5583142
pkgrel=1
pkgdesc="A challenging 3D puzzle game where you must guide the Moppet through the vast and eternal void of space by solving the various and beautiful puzzles thrown at you"
arch=('i686' 'x86_64')
url="https://bitbucket.org/Knitter/puzzlemoppet/overview"
license=('WTFPL')
depends=('irrlicht' 'ode' 'openal')
makedepends=('make' 'cmake' 'git')
conflicts=('puzzle-moppet-bin')
source=(${pkgname}::git+https://bitbucket.org/Knitter/puzzlemoppet.git)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}/puzzlemoppet"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_FOR_INSTALL=ON .
    make
}

package() {
    cd "${srcdir}/${pkgname}/puzzlemoppet"
    make install DESTDIR=$pkgdir
}
