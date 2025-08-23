# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=allelecount
_pkgname=alleleCount
pkgver=4.3.0
pkgrel=4
pkgdesc="program for estimating the NGS copy number" 
arch=('x86_64')
url="http://cancerit.github.io/alleleCount/"
license=('AGPL-3.0-or-later')
depends=('glibc' 'htslib' 'bzip2' 'xz' 'zlib')
makedepends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cancerit/alleleCount/archive/refs/tags/v${pkgver}.tar.gz"
		'htslib_hardening.patch'
		)
b2sums=('f0f2077d0efed1a9f4db76648ae375ea30989909d255917b5b280e32187a27aaf1e1844bccae8b659c34081d34592d3782b7d6df926ece79dcea62cb966b4539'
        'b690635a2f9aa89ceacda7aab1d47ab9044fdf2e48f680a63f6c3c5202211bd87da44046a005f8ca0f8524eb277ca719718af0b58eb7d8cd2a270629c9e6a696')

prepare(){
    cd ${_pkgname}-${pkgver}/
    patch -p1 < ${srcdir}/htslib_hardening.patch
}

build() {
	cd ${_pkgname}-${pkgver}/c
	make -j1 prefix=/usr
}

package() {
	cd ${_pkgname}-${pkgver}/c/bin
	install -Dm755 alleleCounter ${pkgdir}/usr/bin/alleleCounter
}
