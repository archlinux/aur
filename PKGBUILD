# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=cppgraphqlgen
pkgver=4.5.0
pkgrel=3
pkgdesc="Set of GraphQL libraries and tools"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/cppgraphqlgen"
license=('MIT')
depends=(
    'boost-libs'
    'pegtl'
)
makedepends=(
    'cmake'
    'rapidjson'
)
source=(https://codeload.github.com/microsoft/$pkgname/tar.gz/v$pkgver)
md5sums=('45b0994a06acd0a2602b2bca126f897b')

build()
{
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DGRAPHQL_INSTALL_TOOLS_DIR=/usr/lib/ -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -Wno-dev ..
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}

