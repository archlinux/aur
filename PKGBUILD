# Maintainer: Guilhem Saurel <gsaurel at laas dot fr>

pkgname=resource-retriever
_pkgname=resource_retriever
pkgver=1.50.0
pkgrel=1
pkgdesc="Package used to retrieve resources of different kinds, e.g. http://, file://, the ROS specific package://, etc."
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$_pkgname"
license=('BSD')
depends=('urdfdom' 'curl' 'boost')
makedepends=('cmake')
source=("https://github.com/humanoid-path-planner/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz" "include_sstream.patch")
md5sums=('71fb18d819353314988ab102325609d9' '8738f03b2cc50b4f77e933bdc858f094')

prepare() {
    # patch a missing include
    cd "$_pkgname-$pkgver"
    patch -p1 -i $srcdir/include_sstream.patch
}

build() {
    cd "$_pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
