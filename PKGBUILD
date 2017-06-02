# Maintainer: Zachary Elliott <contact@zell.io>

pkgname=pdf2laser
pkgver=0.4.0
pkgrel=1
epoch=0
pkgdesc="CLI tool printing pdf files to an Epilog laser cutter over the network"
arch=(x86_64)
url="https://github.com/zellio/pdf2laser"
license=('GPL3')
depends=('ghostscript')
makedepends=()
source=("https://github.com/zellio/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('257e084e724ec2ad32a0541b1cc12403d54aca2a66c760670c8c345342115e59b2e68be5913a02f3253709de88172865ab5e499c53a12ded8f4c3cf0c013013d')


build() {
	cd "$pkgname-$pkgver"
	aclocal -I m4 --install
	autoheader
	libtoolize --force
	automake --add-missing --foreign
	autoconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	cd "$pkgdir"
	mkdir -p usr/share/bash-completion/completions
    mv usr/etc/bash_completion.d/pdf2laser usr/share/bash-completion/completions
	rmdir usr/etc/bash_completion.d usr/etc
}
