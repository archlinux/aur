# Maintainer : JSkier <jskier at gmail dot com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hyperscan-git
pkgver=4.4.1.r536.gaff7242
pkgrel=1
epoch=1
pkgdesc='A high-performance multiple regex matching library, commonly used with suricata or snort'
arch=('i686' 'x86_64')
url="https://01.org/hyperscan/"
license=('BSD')
provides=('hyperscan')
makedepends=('boost' 'ragel' 'cmake')
source=("git+https://github.com/01org/hyperscan")
sha512sums=('SKIP')

function pkgver() {
    cd hyperscan
    git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd hyperscan
    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_STATIC_AND_SHARED=1
    make
}

package()
{
    cd hyperscan
    install -Dm644 \
        COPYING \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    cd build
    make install DESTDIR="$pkgdir"
}
