# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=gawk-haru
_project=gawkextlib
pkgver=1.0.2
pkgrel=3
pkgdesc="GAWK extension - interface to the libharu PDF library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gawkextlib/"
license=('GPL')
depends=('gawkextlib' 'glibc' 'libharu')
source=("https://downloads.sourceforge.net/$_project/$pkgname-$pkgver.tar.gz"
        fix-build.patch)
md5sums=('a2e5a2f3dfe2a49460719e1fe485d45d'
         '60a68570d1d4c30c3cfd4c709a641972')
sha256sums=('92fb8d83b71de2fe2aec0bc2468459e728290e0c675ca8c19aaf195ba3cad9b6'
            'e9676ac113dee0b3ce4af34618c2793dd6c8c6e869c2157b8b228270b440d962')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir"/fix-build.patch
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-silent-rules
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
