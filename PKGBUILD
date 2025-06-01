# Maintainer: aksr <aksr at t-com dot me>
pkgname=mined-git
pkgver=2022.27.r42.g4e86579
pkgrel=1
pkgdesc='A powerful text editor with a comprehensive and easy-to-use user interface and fast, small-footprint behaviour.'
arch=('i686' 'x86_64')
url='http://towo.net/mined/'
license=('GPLv3')
depends=(desktop-file-utils)
makedepends=('git')
conflicts=("${pkgname%-*}")
#install="${pkgname}.install"
source=("$pkgname::git+https://github.com/mined/mined")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make CFLAGS='-std=gnu11 -Wtype-limits'
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
