# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rst-converters-cpp'
pkgver=0.14.0.ec05a16
pkgrel=1
pkgdesc='Robotics Systems Types converters fro C++'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rst'
license=('LGPL3')
depends=('rsc' 'boost' 'rsb-cpp' 'opencv')
makedepends=('git' 'cmake')
source=("rst-converters-cpp::git+https://code.cor-lab.org/git/rst.git.converters-cpp#branch=0.14")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/rst-converters-cpp"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

check() {
    cd "${srcdir}/rst-converters-cpp/build"
    make test
}

build() {
    cd "${srcdir}/rst-converters-cpp"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rst-converters-cpp/build"
    make DESTDIR="${pkgdir}/" install
}
