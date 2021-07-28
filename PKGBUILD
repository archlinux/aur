# Maintainer: Vincenzo Maffione <v.maffione at gmail dot com>

pkgname=openucx
pkgver=1.11.0
pkgrel=1
pkgdesc="Unified Communication X (http://www.openucx.org)"
arch=('any')
url="http://www.openucx.org"
license=('BSD')
depends=('numactl' 'rdma-core')
makedepends=('git')
source=('git+https://github.com/openucx/ucx.git#tag=v1.11.0')
noextract=()
md5sums=('SKIP')

build() {
    cd $srcdir/ucx
    ./autogen.sh
    ./contrib/configure-release --prefix=/usr CFLAGS="-Wno-address-of-packed-member -O2"
    make
}

file_is_elf()
{
    local filename=$1
    ELF="1"
    readelf -h "$filename" > /dev/null 2>&1 || ELF="0"
    echo "$ELF"
}

package() {
    cd "$srcdir"/ucx
    make DESTDIR="$pkgdir/" install
}
