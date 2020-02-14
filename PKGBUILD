# Maintainer: Laura Demkowicz-Duffy

pkgname=pascal-fc
pkgver=1
pkgrel=2
epoch=
pkgdesc="An implementation of pascal with extra constructs for teaching concurrent programming"
arch=('x86_64')
url="https://github.com/danieljabailey/Pascal-FC"
license=('GPL2')
depends=('fpc' 'git')
makedepends=('fpc')
source=('pascal-fc::git+git://github.com/danieljabailey/Pascal-FC#commit=5d0e1e919d6cce435d965c7eae847ea7bd0aa8db'
	'path_fix.patch')
noextract=()
md5sums=('SKIP'
         '8d52b2db9b651db21402b3f4f6fa9af9')

prepare() {
	cd "$srcdir/$pkgname"
	patch --forward --strip=1 --input="${srcdir}/path_fix.patch"
}

build() {
	cd "$srcdir/$pkgname"
	make pfccomp
	make pint
}

package() {
	cd "$srcdir/$pkgname"
	install -D pfccomp $pkgdir/usr/bin/pfccomp
	install -D pint $pkgdir/usr/bin/pint
	install -D pfc.sh $pkgdir/usr/bin/pfc
}
