# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgorg=stack-of-tasks
pkgname=pinocchio
_pkgver=2.0.0-alpha
pkgver=2.0.0_alpha
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/$pkgorg/$pkgname/"
license=('LGPL3')
depends=('eigen' 'hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('metapod-git' 'lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake')
source=("$url/releases/download/v$_pkgver/$pkgname-$_pkgver.tar.gz")
sha1sums=('618de8a439e3cdc482680269f0b0e30147ace01b')

build() {
    cd "$pkgname-$_pkgver-dirty"

    # use python3
    sed -i 's/BOOST_OPTIONAL_COMPONENTS} python/BOOST_OPTIONAL_COMPONENTS} python3'/ CMakeLists.txt

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$_pkgver-dirty"
    make DESTDIR="$pkgdir/" install
}
