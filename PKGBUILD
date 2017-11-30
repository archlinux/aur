# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname=autofdo
pkgname=$_pkgname-git
pkgver=v0.1.r63.cf651b8
pkgrel=1
pkgdesc="a tool to convert perf.data profile to AutoFDO profile that can be used by GCC and LLVM"
arch=('x86_64')
url="https://github.com/google/autofdo"
license=('Apache')
depends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("$_pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
