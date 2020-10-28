# Maintainer: Markus Rippl <markus dot rippl at dlr dot de>
pkgname="rnxcmp"
pkgver=4.0.8
pkgrel=1
epoch=
pkgdesc="RNX2CRX and CRX2RNX for compression/restoration of RINEX observation files developed by Y. Hatanaka of GSI"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://terras.gsi.go.jp/ja/crx2rnx.html"
license=('custom')
groups=()
depends=('tcsh') # only for wrapper scripts
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog="CHANGES.txt"
source=("http://terras.gsi.go.jp/ja/crx2rnx/RNXCMP_${pkgver}_src.tar.gz")
noextract=()
md5sums=("0efa55a89044836a8700ef1502341e51")
validpgpkeys=()

#prepare() {
#cd "$pkgname-$pkgver"
#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "RNXCMP_${pkgver}_src/source"
	gcc -ansi -O2 -static rnx2crx.c -o RNX2CRX
	gcc -ansi -O2 -static crx2rnx.c -o CRX2RNX
}

#check() {
#cd "$pkgname-$pkgver"
#make -k check
#}

package() {
        mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/doc/$pkgname $pkgdir/usr/share/licenses/$pkgname

	cp $srcdir/RNXCMP_${pkgver}_src/source/RNX2CRX $pkgdir/usr/bin/
        cp $srcdir/RNXCMP_${pkgver}_src/source/CRX2RNX $pkgdir/usr/bin/
	cp -r $srcdir/RNXCMP_${pkgver}_src/front-end-tools/unix/* $pkgdir/usr/bin
	cp -r $srcdir/RNXCMP_${pkgver}_src/docs/* $pkgdir/usr/share/doc/$pkgname
	cp -r $srcdir/RNXCMP_${pkgver}_src/docs/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}


