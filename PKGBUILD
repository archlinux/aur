# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=adaptit
pkgver=6.11.6
pkgrel=1
pkgdesc='Translation editor optimized for adapting existing translations in related languages'
arch=(x86_64)
url=https://adapt-it.org/
_url="https://github.com/adapt-it/$pkgname"
license=('LGPL-2.1-or-later OR CPL')
depends=(wxwidgets-gtk3)
makedepends=(zip)
_archive="$pkgname-$pkgname-$pkgver"
source=("$_url/archive/$pkgname-$pkgver/$_archive.tar.gz")
sha256sums=('cf3082e64877893d6296b58bd9394fc0d9d40dc3c203e202663585fa62d65170')

prepare() {
	cd "$_archive/bin/linux"
	./autogen.sh
	# Artifact directory is used it derive a build profile
	# c.f. $(top_srcdir)/scripts/build-ai.sh
	mkdir -p UnicodeRelease
}

build() {
	cd "$_archive/bin/linux/UnicodeRelease"
	../configure
	make
}

package() {
	cd "$_archive/bin/linux/UnicodeRelease"
	make install DESTDIR="$pkgdir"
}
