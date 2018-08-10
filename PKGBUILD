# $Id$
# Maintainer: Timo Sarawinski <timo@muhviehstarr.de>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: Patch by devttys0 https://github.com/devttys0/sasquatch 

pkgname=sasquatch
_origpkgname=squashfs-tools
pkgver=4.3
pkgrel=7
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux."
url="https://github.com/devttys0/sasquatch"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gzip' 'zlib' 'lzo' 'xz' 'lz4')
source=('git+https://github.com/devttys0/sasquatch'
	'read_fragment_table_n_stack_overflow-fix.patch'
	)
sha256sums=('SKIP'
	'120c2d208085129235bf998b1c22abee19db26120a98174b9beb5edd7b9c84e9' )

build() {
    cd ${srcdir}/sasquatch/ 
    wget https://downloads.sourceforge.net/project/squashfs/squashfs/squashfs4.3/squashfs4.3.tar.gz
    tar -zxvf squashfs4.3.tar.gz
    cd squashfs4.3
    patch -p0 < ../patches/patch0.txt
    cd squashfs-tools
    patch -p0 -i "${srcdir}/read_fragment_table_n_stack_overflow-fix.patch"
    make
}

package() {
    cd ${srcdir}/sasquatch/squashfs4.3/squashfs-tools
   make INSTALL_DIR="${pkgdir}"/usr/bin install
}
