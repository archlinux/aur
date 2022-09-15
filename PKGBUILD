pkgname=concurrentluajit
pkgver=1.1
pkgrel=1
pkgdesc='ConcurrentLua for LuaJIT'
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
    luajit
)
conflicts=(concurrentlua51)
url='https://lefcha.github.io/concurrentlua/'
license=('MIT')
source=("git+https://github.com/lefcha/concurrentlua.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/concurrentlua"
    make CC="cc -I /usr/include/luajit-2.1" LIBLUA="-lluajit-5.1" all
}

package() {
    cd "$srcdir/concurrentlua"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
