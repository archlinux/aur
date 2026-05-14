# SPDX-FileCopyrightText: 2026 Julian Brost <julian@0x4a42.net>
# SPDX-License-Identifier: MIT

# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=no-kmod-autoload
pkgver=0.1.0
pkgrel=1
pkgdesc='Disable automatic loading of kernel modules'
arch=(any)
url='https://codeberg.org/jb/no-kmod-autoload'
license=(MIT)
depends=(bash)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/jb/no-kmod-autoload/archive/v0.1.0.tar.gz")
sha256sums=('175d0fd810e9decbaa3d61925e888ed1e78f33bce947e4bbe8ae47da6142de95')

_make_opts=(prefix=/usr libexecdir=/usr/lib)

build() {
	cd "$srcdir/$pkgname"
	make "${_make_opts[@]}"
}

package() {
	cd "$srcdir/$pkgname"
	make "${_make_opts[@]}" DESTDIR="$pkgdir/" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
