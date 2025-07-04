# Maintainer: Luciano Ciccariello <xeeynamo@hotmail.com>

pkgname=binutils-mipsel-linux-gnu
pkgver=2.44
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the MIPS architecture"
arch=('x86_64')
url="http://www.gnu.org/software/binutils/"
license=('FSFAP' 'GFDL-1.3' 'GPL-2.0-or-later' 'GPL-3.0-or-later' 'LGPL-2.0-or-later' 'LGPL-3.0-or-later')
depends=('glibc' 'jansson' 'libelf' 'zlib' 'zstd')
makedepends=('xz')
conflicts=('cross-mipsel-linux-gnu-binutils')
provides=('mipsel-linux-gnu-binutils')
source=("binutils-$pkgver.tar.xz::https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('ce2017e059d63e67ddb9240e9d4ec49c2893605035cd60e92ad53177f4377237')

build() {
    cd "binutils-$pkgver"
    ./configure \
        --prefix=/usr \
        --target=mipsel-linux-gnu \
        --with-sysroot \
        --with-float=soft \
        --disable-nls \
        --disable-werror \
        --infodir=/opt/mipsel-linux-gnu/share/info \
        --libdir=/opt/mipsel-linux-gnu/lib
    make -j$(nproc)
}

check() {
    cd "binutils-$pkgver"
    make -k check
}

package() {
    cd "binutils-$pkgver"
    make DESTDIR="$pkgdir/" install
}
