# Maintainer: Sándor Nagy <sanya868[at]gmail[dot]com>
pkgname=soccerwindow2
pkgver=5.1.0
pkgrel=1
pkgdesc="RoboCup Soccer Simulator"
arch=('x86_64' 'i686')
url="http://rctools.sourceforge.jp/"
license=('CCPL')
groups=('rcss')
depends=('librcsc>=4.0.1' 'qt4>=4.3')
makedepends=('boost>=1.32')
optdepends=(
	'rcssserver:	RCSS Server'
	'rcssmonitor:	RCSS Monitor')
options=('buildflags' 'makeflags')
source=(http://jaist.dl.sourceforge.jp/rctools/51942/$pkgname-$pkgver.tar.gz
	$pkgname-$pkgver.patch)
sha512sums=('e417965a8e6c24d915930306f795edc7571b3edd4ba6879914799aa49089dd1296672bb231c73dbdb707e61a65c4f17bbafedd610b861a16d0cf9ce575152d4f'
            '5ee3841d7e89ac4fdd0af52364ee24ebc37a30865909cb50f78002e17ba0f83da4938ae7eef91d765a4b81ef27570b45e3284187e1d6c204d4eb59b9d4cfd9f7')

prepare() {
        cd "$srcdir/$pkgname-$pkgver"
        patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
