# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=allelecount
_pkgname=alleleCount
pkgver=4.3.0
pkgrel=1
pkgdesc="program for estimating the NGS copy number" 
arch=('x86_64')
url="http://cancerit.github.io/alleleCount/"
license=('AGPL3')
depends=('glibc' 'htslib' 'bzip2' 'xz' 'zlib')
makedepends=('quilt' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cancerit/alleleCount/archive/refs/tags/v${pkgver}.tar.gz"
		'series'
		'harden.patch')
b2sums=('f0f2077d0efed1a9f4db76648ae375ea30989909d255917b5b280e32187a27aaf1e1844bccae8b659c34081d34592d3782b7d6df926ece79dcea62cb966b4539'
        '55807c3d06f035d18040248d272bb150bc84ef44c4e01ae984f3abe27fd34d6f18abe5bc1cbb2945435725d2344a5b5209b37ac322cc1ff5fae1612c265c1b9b'
        '9de3b1c44db6e8b0e2321450d19d741ad233eabb00d32c6f951e78177ee1bd36d150c3685eb7c373f806c694d3c84b94e7e4fd5683387f85587de35a646c7066')

prepare(){
    mkdir -p ${_pkgname}-${pkgver}/patches
    cp *.patch ${_pkgname}-${pkgver}/patches
    cp series ${_pkgname}-${pkgver}/patches
    # Apply Patches
    cd ${_pkgname}-${pkgver}/patches
    quilt push -a
}

build() {
	cd ${_pkgname}-${pkgver}/c
	export HTSLIB=/usr/lib
	make prefix=/usr
}

package() {
	cd ${_pkgname}-${pkgver}/c/bin
	install -Dm755 alleleCounter ${pkgdir}/usr/bin/alleleCounter
}
