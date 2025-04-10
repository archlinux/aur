# Maintainer: Rodrigo Pelorosso <rodrigo.pelorosso@gmail.com>

pkgname=pcb-tracer
pkgver=0.1.0
pkgrel=1
pkgdesc="A PCB tracing tool"
arch=('x86_64')
url="https://github.com/rpelorosso/pcb-tracer"
license=('GPL')
depends=('qt6-base')
makedepends=('cmake' 'git')
source=("git+https://github.com/rpelorosso/pcb-tracer.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    
    # Try to use make install if available
    if make -n install &>/dev/null; then
        make DESTDIR="$pkgdir" install
    else
        # Manual installation if make install is not available
        install -Dm755 pcb_tracer "$pkgdir/usr/bin/pcb_tracer"
    fi
}