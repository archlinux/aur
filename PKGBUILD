# Maintainer: aksr <aksr at t-com dot me>
pkgname=redo-c-git
pkgver=r80.1be4d13
pkgrel=1
pkgdesc='An implementation of the redo build system in portable C with zero dependencies.'
arch=('i686' 'x86_64')
url='https://github.com/chneukirchen/redo-c'
license=('publicdomain')
makedepends=('git')
conflicts=('redo-jdebp' 'redo-python' 'redo-sh')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	gcc -g -Os -Wall -Wextra -Wwrite-strings -o redo redo.c 
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 redo $pkgdir/usr/bin/redo
	install -D -m755 redo-sources $pkgdir/usr/bin/redo-sources
	install -D -m755 redo-targets $pkgdir/usr/bin/redo-targets
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
