# Maintainer: aksr <aksr at t-com dot me>
pkgname=unicon-git
pkgver=13.2.r785.g94eada80
pkgrel=1
pkgdesc='An extended dialect of Icon: a very high level, goal-directed, object-oriented, general purpose applications language.'
arch=('i686' 'x86_64')
url='http://www.unicon.org/'
license=('publicdomain' 'GPL-2.0')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "${pkgname%-*}-svn")
source=("$pkgname::git+https://github.com/uniconproject/unicon")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./configure --enable-uniconx --enable-ovld --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
#	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}
