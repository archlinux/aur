# Maintainer: aksr <aksr at t-com dot me>
pkgname=videoteco-fork-git
pkgver=r27.415ef16
pkgrel=2
pkgdesc='A text editing program.'
arch=('i686' 'x86_64')
url='http://www.copters.com/teco.html'
url='https://github.com/rhaberkorn/videoteco-fork'
license=(GPL)
depends=('ncurses')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/rhaberkorn/videoteco-fork.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 teco $pkgdir/usr/bin/videoteco
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
