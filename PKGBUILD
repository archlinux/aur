# Maintainer: Piotr Balwierz
pkgname=bedtools
pkgver=2.31.0
epoch=1
pkgrel=3
pkgdesc='powerful toolset for genome arithmetic'
arch=('i686' 'x86_64')
url="https://github.com/arq5x/bedtools2"
license=('GPL2')
depends=('bash' 'zlib' 'python')
checkdepends=('samtools')
source=("https://github.com/arq5x/bedtools2/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
	"$pkgname.patch::https://github.com/arq5x/bedtools2/pull/1045.patch")
sha1sums=('c45dcdd7af1d6ef3ec0d6dc6a3f3714e7221c2ff'
          'e31195461dd004025c05edfe22329f4c97e02cb8')

prepare() {
	cd $srcdir/${pkgname}2
	patch -p1 < $srcdir/$pkgname.patch
}

build()
{
	cd $srcdir/${pkgname}2
	make
}

#check disabled because it requires python and samtools. Uncomment if you wish.
#~ check()
#~ {
	#~ cd $srcdir/${pkgname}2
	#~ make test
#~ }

package()
{
	cd $srcdir/${pkgname}2
	for f in bin/*
	do
		install -Dm755 $f $pkgdir/usr/bin/$(basename $f)
	done
}

