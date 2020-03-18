# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>
pkgname=qflow-git
pkgver=1.4.r306.7746623
pkgrel=1
epoch=
pkgdesc='Opensource physical implementation flow'
arch=('i686' 'x86_64')
provides=('qflow')
conflicts=('qflow')
url='http://opencircuitdesign.com/qflow/'
license=('GPL')
depends=('magic' 'qrouter' 'tcsh' 'yosys' 'netgen-lvs')
makedepends=('git')
optdepends=(
    'graywolf: Placement support' 
    'opensta: Alternative static timing analysis tool')
source=("git://opencircuitdesign.com/qflow#branch=qflow-1.4")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 }

build() {
    cd "${srcdir}/${pkgname%-git}"
    ./configure \
        --prefix=/usr 
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}" install
}

