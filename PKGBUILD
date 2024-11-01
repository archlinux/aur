#!/bin/bash
# Maintainer: 3bd <3bd3bdr@gmail.com>
# Dash with libedit support

pkgname=dash-editline-git
pkgver=0.5.12
pkgrel=1
pkgdesc="POSIX compliant shell that aims to be as small as possible. (Dynamic libedit support)"
arch=('x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
provides=(dash)
conflicts=(dash)
depends=(libedit)
source=("http://gondor.apana.org.au/~herbert/dash/files/dash-${pkgver}.tar.gz")
sha512sums=('13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17')

build(){
	cd "dash-$pkgver"
	./configure --with-libedit
	make
}

package(){
	cd "dash-$pkgver/src"
	mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
	cp -- dash "$pkgdir"/usr/bin/
	gzip dash.1
	cp -- dash.1.gz "$pkgdir"/usr/share/man/man1
}
