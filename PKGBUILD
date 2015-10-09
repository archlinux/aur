# Maintainer: Chiu-Hsiang Hsu <wdv4758h@gmail.com>

pkgname=igprof-git
pkgver=v5.9.15.r13.gb482572
pkgrel=1
pkgdesc="A simple tool for measuring and analysing application memory and performance characteristics"
arch=('i686' 'x86_64')
url="http://igprof.org/"
license=('GPL')
groups=()
depends=('libatomic_ops'
         'libunwind'
         'pcre'
         'python')
makedepends=('cmake')
source=("$pkgname::git+https://github.com/igprof/igprof/")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
    cd $pkgname
    sed -i 's|-Werror||g' CMakeLists.txt
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-g -O3" .
    make
}

package() {
    cd $pkgname
    make DESTDIR="${pkgdir}" install
}
