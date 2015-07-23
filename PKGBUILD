# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=libgd-doc
pkgver=2.1.1
pkgrel=1
pkgdesc="Reference documentation for libgd, HTML format."
arch=('any')
url="https://bitbucket.org/libgd/gd-libgd/"
license=('unknown')
conflicts=('libgd-doc-git')
makedepends=('naturaldocs')
source=(https://bitbucket.org/libgd/gd-libgd/downloads/libgd-$pkgver.tar.gz
	missing_getver.patch)
md5sums=('914f27f31ceb46827a322a1bc5165aff'
	'b6c4bd7db10c83f6048dcffc5475defa')


build() {

	# Apply patch
	cd "$srcdir/libgd-$pkgver/config"
	patch -N -i "$srcdir/missing_getver.patch"

	# Build docs
	cd "$srcdir/libgd-$pkgver/docs/naturaldocs"
	./run_docs.sh
}

package() {
	cd "$srcdir/libgd-$pkgver/docs/naturaldocs"

	mkdir -p $pkgdir/usr/share/doc/libgd
	cp -r html/ $pkgdir/usr/share/doc/libgd/
}
