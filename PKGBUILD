# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=namedtype-git
pkgver=v1.1.0.r61.g020be1e
pkgrel=1
pkgdesc="C++ strong type library"
arch=(any)
url="https://github.com/joboccara/NamedType"
makedepends=(
	'cmake'
)
license=('MIT')
source=("$pkgname::git+https://github.com/joboccara/NamedType.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    ls
    cmake \
        -B "build" \
        -S "$srcdir/$pkgname" \
        -DENABLE_TEST=OFF \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
