# Maintainer: Piotr Balwierz
pkgname=bedtools
pkgver=2.31.1
epoch=1
pkgrel=1
pkgdesc='powerful toolset for genome arithmetic'
arch=('i686' 'x86_64')
url="https://github.com/arq5x/bedtools2"
license=('GPL2')
depends=('bash' 'zlib')
makedepends=('python')
checkdepends=('samtools')
source=("https://github.com/arq5x/bedtools2/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('5b6a19564164613bced1f7efc07a081dd3bab6cb')

prepare(){
	cd $srcdir/${pkgname}2
	sed -i "s@python3@python@g" Makefile
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

