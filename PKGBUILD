# Maintainer: Ryan Farley <ryan.farley@gmx.com>
pkgname=rsbep-backup-git
pkgver=r6.1a6da31
pkgrel=1
pkgdesc="A customized version of rsbep used to create resilient backups"
arch=('armv7h' 'i686' 'x86_64')
url="https://www.thanassis.space/rsbep.html"
license=('GPL')
makedepends=('git' 'python2' 'python2-fuse')
optdepdends=('python2-fuse: poorZFS support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rsbep-backup::git+https://github.com/ttsiodras/rsbep-backup.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	#python2 required
	sed -i '1s/python/python2/' contrib/poorZFS.py
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
