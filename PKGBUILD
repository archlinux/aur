# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=rsbep-backup-git
pkgver=r12.f3486ad
pkgrel=1
pkgdesc="A customized version of rsbep used to create resilient backups"
arch=('armv7h' 'i686' 'x86_64')
url="https://www.thanassis.space/rsbep.html"
license=('GPL')
makedepends=('git' 'python' 'python-fuse')
optdepdends=('python-fuse: poorZFS support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rsbep-backup::git+https://github.com/ttsiodras/rsbep-backup.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	sed -i s/aclocal-1.16/aclocal/g Makefile
	sed -i s/automake-1.16/automake/g Makefile
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
