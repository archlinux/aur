#!/bin/bash
# Maintainer: 3bd <3bd3bdr@gmail.com>
# Dash with libedit support

pkgname=dash-editline-git
pkgver=0.5.12
pkgrel=4
pkgdesc='POSIX compliant shell that aims to be as small as possible. (Dynamic libedit support)'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/utils/dash/dash.git'
license=('BSD')
provides=(dash)
conflicts=(dash)
depends=(libedit)
makedepends=(git)
source=('git://git.kernel.org/pub/scm/utils/dash/dash.git')
sha256sums=('SKIP')

build(){
	cd dash
	./autogen.sh
	./configure --with-libedit
	for p in ../../*.patch;do
		patch -p1 <"$p"
	done
	make
}

package(){
	cd dash/src
	mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
	cp -- dash "$pkgdir"/usr/bin/
	gzip -kf dash.1
	cp -- dash.1.gz "$pkgdir"/usr/share/man/man1
}
