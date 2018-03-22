#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libringqt
pkgname=$_pkgname-git
pkgver=r1744.9232d14
pkgrel=1
pkgdesc="A library for GNU Ring, a secure communication platform"
arch=('x86_64')
url="https://github.com/Elv13/$_pkgname"
license=('LGPL')
groups=('ring')
depends=('ring-daemon' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../"$_pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
