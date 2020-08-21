# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname='eli'
pkgver='4.8.1'
pkgrel=1
pkgdesc='A programming environment that supports all phases of translator construction.'
arch=('x86_64')
url='https://sourceforge.net/projects/eli-project/'
license=('GPL2')
depends=('bash' 'libxaw')
makedepends=('gcc9')
source=("$pkgname-$pkgver.tar.bz2::https://sourceforge.net/projects/eli-project/files/Eli/Eli%20$pkgver/$pkgname-$pkgver.tar.bz2/download")
sha256sums=('12f2e02ebd807f936fd3c9225b0947c88d0fe7275146d64ace7cc1810ab22aef')

build() {
	cd "$pkgname-$pkgver"
	CC=gcc-9 ./configure
	make nobrowsers
}

package() {
	cd "$pkgname-$pkgver"
	echo 'y' | ./install.sh "$pkgdir/usr"
	sed -e "s;$pkgdir/usr;/usr;" -i'' "$pkgdir/usr/bin/eli" "$pkgdir/usr/bin/odin"
	install -dm755 "$pkgdir/usr/share/man" "$pkgdir/usr/share/doc/eli"
	mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
	mv "$pkgdir/usr/doc/Eli" "$pkgdir/usr/share/doc/eli"
	rmdir "$pkgdir/usr/doc"
}
