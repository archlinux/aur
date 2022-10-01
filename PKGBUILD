# Maintainer: Huzaifa Shaikh <shk.huz@gmail.com>
pkgname=aria-git
pkgver=0.0.1.r4.9ffa9e3
pkgrel=1
pkgdesc="An experimental low-level programming language built to improve on C."
arch=('x86_64')
url="https://shkhuz.github.io/aria"
license=('GPL3')
depends=('llvm' 'lld')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/shkhuz/aria.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd $srcdir/${pkgname%-git}
	make build/aria
}

package() {
	cd $srcdir/${pkgname%-git}
	make DESTDIR=$pkgdir/ install
}
