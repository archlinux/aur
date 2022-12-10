# Maintainer: Andy Massimino <mass at gmx dot se>
# Contributor: pancho horrillo <pancho at pancho dot name>
# Contributor: Ray Hogenson <rayhogenson at gmail dot com>
pkgname=par
pkgver=1.52
pkgrel=9
pkgdesc='Paragraph reformatter'
url='http://www.nicemice.net/par/'
depends=()
arch=('x86_64' 'i686' 'aarch64' 'arm7h' 'arm6h' 'arm')
license=('custom')
source=('http://www.nicemice.net/par/Par152.tar.gz'
	'par-1.52-i18n.4.patch')
sha512sums=('f5a46da4b693e6a3d15ccd57e24ee9b0332ebfbcfc88da9ef0731e18932ba6f0adde7691a233264d6361e8903ff7e2263f71885a415c896dc4c45a0d05b1978e'
	    '40af77123cbecb39c465dad9875d4e37914457da4a513c3e37634fbabedef8f839d9dff392fabc272665aa153e89d436cb87121e86fd279aae97656383914f01')
_dirname='Par152'

prepare() {
	cd "$_dirname"
	patch -Np1 -i "$srcdir/par-1.52-i18n.4.patch"
}

build() {
	cd "$_dirname"
	make -f protoMakefile CC="cc $CFLAGS -std=c99 -D_GNU_SOURCE -c" LINK1="cc $LDFLAGS"
}

package() {
	cd "$_dirname"
	install -Dm755 -D par		"$pkgdir/usr/bin/par"
	install -Dm644 -D par.1		"$pkgdir/usr/share/man/man1/par.1"
	install -Dm644 -D par.doc	"$pkgdir/usr/share/licenses/$pkgname/par.doc"
}
