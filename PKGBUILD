# Maintainer: Laura Demkowicz-Duffy

pkgname=pascal-fc
pkgver=1
pkgrel=5
epoch=
pkgdesc="An implementation of pascal with extra constructs for teaching concurrent programming"
arch=('x86_64')
url="https://github.com/danieljabailey/Pascal-FC"
license=('GPL2')
makedepends=('git' 'fpc')
optdepends=('bash')
source=('pascal-fc::git+git://github.com/lexbailey/Pascal-FC#commit=b1bd078511879f8b678c8f7395d727953415926f'
	'install_script.patch')
noextract=()
md5sums=('SKIP'
         '787022791be8587ae796c3c0dae7a25d')

prepare() {
	cd "$srcdir/$pkgname"
	patch --forward --strip=1 --input="$srcdir/install_script.patch"
}

build() {
	cd "$srcdir/$pkgname"
	make pfccomp
	make pint
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr/bin" install
}
