# Maintainer: spider-mario <spidermario@free.fr>
pkgname=sacd-extract
pkgver=0.3.8
pkgrel=1
pkgdesc="Extract DSD files from an SACD image"
arch=('i686' 'x86_64')
url="https://sourceforge.net/p/sacd-ripper/"
license=('GPL2')
depends=('glibc')
makedepends=('cmake' 'svn')
source=('sacd-ripper::svn+http://svn.code.sf.net/p/sacd-ripper/code/trunk#revision=399'
        missing-typedefs.patch)
sha512sums=('SKIP'
            '0585afc0b30303ebb9839ad3b2152a1f80f80a5d50384b07a376bce04de29aed82c409fb7f74cd44141a43a194593fcf835cb3ac3133a5262135186b86f5b297')

prepare() {
	cd sacd-ripper
	patch -p1 < "$srcdir"/missing-typedefs.patch
}

build() {
	rm -fr build
	mkdir build
	cd build

	cmake ../sacd-ripper/tools/sacd_extract/

	make
}

package() {
	cd build

	install -Dm755 sacd_extract "$pkgdir"/usr/bin/sacd_extract
}
