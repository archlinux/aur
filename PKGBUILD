# Maintainer: Kristóf Jakab <jaksi@jaksi.io>
pkgname=libzorpll-git
pkgver=6.0.6.0
pkgrel=1
pkgdesc="Low level library functions for Zorp"
arch=('x86_64')
url="https://github.com/balabit/libzorpll"
license=('LGPL')
depends=('glib2' 'libcap' 'openssl')
makedepends=('git')
source=('libzorpll::git+https://github.com/balabit/libzorpll.git#branch=6.0.6.0')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libzorpll"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/libzorpll"
	autoreconf -i
	./configure --prefix=/usr --libexecdir=/usr/lib/libzorpll --localstatedir=/var
	make
}

package() {
	cd "$srcdir/libzorpll"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/var/run" "$pkgdir/run"
}
