# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=eigenpy
pkgver=1.4.5
pkgrel=1
pkgdesc="Bindings between numpy and eigen using boost::python"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/$pkgname"
license=('LGPL3')
depends=('boost-libs')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'boost' 'python-numpy')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b53213d6b75f1d21895ca4f28228cf53')

build() {
    cd "$pkgname-$pkgver"

    # use python3
    sed -i 's/BOOST_COMPONENTS python/BOOST_COMPONENTS python3'/ CMakeLists.txt

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
