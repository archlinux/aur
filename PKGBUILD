# Maintainer: aksr <aksr at t-com dot me>
pkgname=re2-git
pkgver=2023.09.01.r7.ga807e8a3
pkgrel=1
pkgdesc='A fast, safe, thread-friendly alternative to backtracking regular expression engines, a C++ library.'
arch=('i686' 'x86_64')
url='https://github.com/google/re2'
license=('BSD')
makedepends=('git' 'gtest')
depends=('abseil-cpp' 'gcc-libs')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's_prefix=/usr/local_prefix=/usr_' Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
	cd "$srcdir/$pkgname"
	make test
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}

