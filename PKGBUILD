pkgname=concurrentlua51
pkgver=1.1
pkgrel=1
pkgdesc='ConcurrentLua for Lua 5.1'
arch=(any)
depends=(
    lua51-socket
    lua51-coxpcall
    lua51-copas
    # copas requires next deps, but they're not listed in package deps
    lua51-binaryheap
    lua51-timerwheel
)
makedepends=(
    git
    make
    cmake
    lua51
)
conflicts=(concurrentluajit)
url='https://lefcha.github.io/concurrentlua/'
license=('MIT')
source=("git+https://github.com/lefcha/concurrentlua.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/concurrentlua"
    make CC="cc -I /usr/include/lua5.1" LIBLUA="-llua5.1" all
}

package() {
    cd "$srcdir/concurrentlua"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
