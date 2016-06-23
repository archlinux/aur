# maintainer: thomas berryhill (oats) thomasberryhill@protonmail.ch

_gitname=xbps
pkgname=xbps-git
pkgver=0.51.r111.gf196abb
pkgrel=1
pkgdesc="Void Linux's homemade binary package manager"
arch=('i686' 'x86_64')
url="https://github.com/voidlinux/xbps"
license=('custom:2-clause-BSD')
depends=('ca-certificates' 'libarchive')
makedepends=('zlib' 'openssl' 'git')
source=('git+https://github.com/voidlinux/xbps.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var/lib/xbps
	make
}

package() {
	cd "$_gitname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 COPYING.3RDPARTY "$pkgdir/usr/share/licenses/$pkgname/COPYING.3RDPARTY"
}
