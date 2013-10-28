#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Flexible Collision Library. Git version."
url='https://github.com/flexible-collision-library'
pkgname=fcl-git
pkgver=20131028
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd')
optdepends=('octomap: collision detection with octrees'
            'tinyxml: support for global penetration depth test'
            'flann: support for fast approximate nearest neighbor searches')
_dir=fcl
source=("$_dir"::'git://github.com/flexible-collision-library/fcl.git'#branch=master)
md5sums=('SKIP')
provides=('fcl')
conficts=('fcl')

pkgver() {
    date +%Y%m%d
}

build() {
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build
    cmake ${srcdir}/${_dir} -DCMAKE_INSTALL_PREFIX=/usr
    make
}

#check() {
#    cd "${srcdir}/build/test"
#    make test
#}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
