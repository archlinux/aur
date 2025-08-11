# Maintainer: Matrix <thysupremematrix atttttttttt tuta dottttttt io>

_pkgname=batcher
pkgname=gimp-plugin-batcher-git
pkgver=1.1.1.r163.g116606c
pkgrel=1
epoch=1
pkgdesc="Batch image processing plug-in for GIMP 3"
arch=(any)
url='https://kamilburda.github.io/batcher/'
license=('BSD-3-Clause')
depends=('gimp>=3' python python-cairo)
makedepends=('git')
source=("git+https://github.com/kamilburda/batcher.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package (){
	cd "$srcdir/$_pkgname"
	for i in *.md; do
		install -Dm644 $i "$pkgdir/usr/share/doc/$pkgname/$i"
	done
	cp -R docs "$pkgdir/usr/share/doc/$pkgname/"
	install -dm744 "$pkgdir/usr/lib/gimp/3.0/plug-ins/"
	cp -R batcher "$pkgdir/usr/lib/gimp/3.0/plug-ins/batcher"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
