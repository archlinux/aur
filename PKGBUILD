# Maintainer: Jan Max Meyer <codepilot@phorward.info>
pkgname=xcdroast
pkgver=1.18
pkgrel=2
epoch=
pkgdesc="X-CD-Roast is a flexible frontend for optical disc authoring."
arch=('i686' 'x86_64' 'armv6h')
url="http://www.xcdroast.org"
license=('GPLv2')
depends=('cdrtools>=3.02a07')
makedepends=("autoconf")
checkdepends=()
#changelog=CHANGELOG
source=("https://downloads.sourceforge.net/project/xcdroast/xcdroast-1.18.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fxcdroast%2F%3Fsource%3Dtyp_redirect&ts=1514374105&use_mirror=netcologne")
md5sums=('0626a528c4848e4c2cffa184b7c1ba2a')

build() {
	cd "$pkgname-$pkgver"

	# Patch src/Makefile.am
	patch -p0 < $startdir/Makefile.patch
	autoreconf -f

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

