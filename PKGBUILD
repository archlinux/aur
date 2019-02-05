# Maintainer: Justin Kim <justin.joy.9to5@gmail.com>

pkgname=hawktracer-git
_srcname=hawktracer
pkgver=0.7.0.r7.gd7821a7
pkgrel=1
pkgdesc='HawkTracer - a highly portable, low-overhead, configurable profiling tool (git version)'
arch=('i686' 'x86_64')
url='https://github.com/loganek/hawktracer'
license=('MIT')
makedepends=('git' 'cmake')
provides=('hawktracer')
conflicts=('hawktracer')
source=('git+https://github.com/loganek/hawktracer.git')
sha512sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        ..

    cmake --build .
}

package() {
    cd "${_srcname}/build"
    
    make DESTDIR="$pkgdir" install
}
