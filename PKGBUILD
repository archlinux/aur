# Maintainer: éclairevoyant

pkgname=termrec
pkgver=0.19
pkgrel=1
pkgdesc="Set of tools for recording/replaying text-terminal session, in the vein of ttyrec"
arch=(x86_64)
url="http://angband.pl/$pkgname.html"
license=(LGPL3)
depends=(glibc gcc-libs)
optdepends=(bzip2 curl xz zlib zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kilobyte/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        0001-Update-autotoolage-via-autoupdate.patch
        0002-Include-stdint.h-unconditionally.patch)
b2sums=('585d650b58d70657c05b6fb0c534f085c33894ec2141d2d0f2b69082dfcf2fa828a71943558aa8148bcec722a19201a30e5be4fe754e4ab95e9cab70ae29a090'
        'c9ad23df3b07586d19c77f8208e2918c503c5183616e4c7206b98400b2f0fd01e4f16df37eba950140c7d2ad99e8e8ecde01f9f4c8d293be493f1d1654079cd0'
        '406ee09a32b2b4da466ade00bc57267e64f1946a799469aa607c6d4b1c02f7c1cf906e3bfec8a03bdd68e13ef4f1ac53c434ca5652b54777620fbf045ee37969')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../0001-Update-autotoolage-via-autoupdate.patch
	patch -Np1 -i ../0002-Include-stdint.h-unconditionally.patch
}

build() {
	cd $pkgname-$pkgver
	./autogen.sh
	./configure --prefix=/usr
	make 
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
}
