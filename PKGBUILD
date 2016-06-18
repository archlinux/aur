# $Id$
# Maintainer: Timo Sarawinski <timo@muhviehstarr.de>
# Original TU: Jeff Mickey <j@codemac.net>
# Contributor: Patch by devttys0 https://github.com/devttys0/sasquatch 

pkgname=sasquatch
_origpkgname=squashfs-tools
pkgver=4.3
pkgrel=4
pkgdesc="Tools for squashfs, a highly compressed read-only filesystem for Linux."
url="https://github.com/devttys0/sasquatch"
license=("GPL")
arch=('i686' 'x86_64')
depends=('gzip' 'zlib' 'lzo' 'xz' 'lz4')
source=("http://downloads.sourceforge.net/sourceforge/squashfs/squashfs${pkgver}.tar.gz"
	 "patch0.txt.gz"
	 "Makefile")
md5sums=('d92ab59aabf5173f2a59089531e30dbf'
	'SKIP' 'SKIP')

prepare() {
    cp Makefile ${srcdir}/squashfs${pkgver}/${_origpkgname}/Makefile.tmp
    cd ${srcdir}/squashfs${pkgver}
    patch -p0 < ../patch0.txt
    mv ${srcdir}/squashfs${pkgver}/${_origpkgname}/Makefile.tmp ${srcdir}/squashfs${pkgver}/${_origpkgname}/Makefile
}

build() {
    cd ${srcdir}/squashfs${pkgver}/${_origpkgname}
    INSTALL_DIR="${pkgdir}"/usr/bin CC=gcc-4.9 make -j5 
}

package() {
    cd ${srcdir}/squashfs${pkgver}/${_origpkgname}
   make INSTALL_DIR="${pkgdir}"/usr/bin install
}
