_name=blktrace
pkgname=${_name}-git
pkgver=blktrace.1.1.0.r35.g8772bc4
pkgrel=1
pkgdesc="Userspace utilities for tracing Linux block layer I/O - Git version"
arch=(i686 x86_64)
license=('GPL2')
url="http://brick.kernel.dk/snaps/"
depends=('libaio')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/axboe/blktrace.git")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_name}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_name}"
  make
}

package() {
  cd "$srcdir/${_name}"
  make prefix=/usr mandir=/usr/share/man DESTDIR=$pkgdir/ install
}
