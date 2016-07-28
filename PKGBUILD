# $Id$
# Maintainer: Timo Sarawinski <timo@muhviehstarr.de>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: Patch by devttys0 https://github.com/devttys0/sasquatch 

pkgname=sasquatch
_origpkgname=squashfs-tools
pkgver=4.3
pkgrel=5
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux."
url="https://github.com/devttys0/sasquatch"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gzip' 'zlib' 'lzo' 'xz' 'lz4')
makedepends=('gcc49')
source=('git+https://github.com/devttys0/sasquatch')
sha256sums=('SKIP')

build() {
    cd ${srcdir}/sasquatch/ 
    wget https://downloads.sourceforge.net/project/squashfs/squashfs/squashfs4.3/squashfs4.3.tar.gz
    tar -zxvf squashfs4.3.tar.gz
    cd squashfs4.3
    patch -p0 < ../patches/patch0.txt
    cd squashfs-tools
    CC=gcc-4.9 make
   # INSTALL_DIR="${pkgdir}"/usr/bin CC=gcc-4.9 make -j5 
}

package() {
    cd ${srcdir}/sasquatch/squashfs4.3/squashfs-tools
   make INSTALL_DIR="${pkgdir}"/usr/bin install
}
