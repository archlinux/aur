# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=rewritefs-git
pkgver=20160301
pkgrel=1
pkgdesc="A FUSE filesystem intended to be used like Apache mod_rewrite"
arch=('i686' 'x86_64')
url="https://github.com/sloonz/rewritefs"
license=('GPL')
depends=('fuse' 'pcre')
makedepends=('git')
source=('git+https://github.com/sloonz/rewritefs.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/rewritefs"
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/rewritefs"
	sed -i "s/\\/usr\\/local/\\/usr/" Makefile
}

build() {
	cd "$srcdir/rewritefs"
	make
}

package() {
	cd "$srcdir/rewritefs"
	make "DESTDIR=$pkgdir" install
}
