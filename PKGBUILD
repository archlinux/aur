# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=jazip
_jazver=0.34
_debver=15.1
pkgver="$_jazver.$_debver"
pkgrel=1
pkgdesc='Program for maintaining Iomega Zip or Jaz drives and disks'
arch=('x86_64')
url='https://structbio.vanderbilt.edu/~jsmith/jazip/'
license=('GPL')
depends=('xforms')
makedepends=('linux-headers')
install=jazip.install
source=("https://structbio.vanderbilt.edu/~jsmith/jazip/jaZip-$_jazver.src.tar.gz"
        "https://deb.debian.org/debian/pool/main/j/jazip/jazip_$_jazver-$_debver.debian.tar.gz")
sha256sums=('d3575c7b9b3d0d8083d7c4752d6d946fac99b71a17fe99918b11e9737592118c'
            '40d37ca1b779f72830e38a81804a2c3e33fbfb39ed02e6be91a433d8d0315b25')

prepare() {
	cd "jaZip-$_jazver"
	cat ../debian/patches/all_patches_to_0.34-14 | patch -p1
}

build() {
	cd "jaZip-$_jazver"
	make CFLAGS='-O -fcommon'
}

package() {
	cd "jaZip-$_jazver"
	install -Dm755 jazip "$pkgdir/usr/bin/jazip"
	install -Dm644 jazip.conf "$pkgdir/etc/jazip.conf"
	install -Dm644 ../debian/copyright "$pkgdir/usr/share/licenses/jazip"
	mkdir -p "$pkgdir/usr/share/jazip"
	cp docs/*.help "$pkgdir/usr/share/jazip"
}
