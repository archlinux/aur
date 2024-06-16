# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Kyle Keen
# Contributor: simongmzlj
pkgname=greed
pkgver=4.3
_gitlabcommit=edb1716c8ad8ffb108dd150a4b8ed2a46592e7cf
pkgrel=1
pkgdesc='A game of consumption. Eat as much as you can before munching yourself into a corner!'
arch=('x86_64')
url='http://www.catb.org/~esr/greed/'
license=('BSD-2-Clause')
depends=('glibc' 'ncurses')
makedepends=('asciidoctor')
backup=(usr/share/greed/greed.hs)
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/esr/greed/-/archive/$_gitlabcommit/greed-$_gitlabcommit.tar.gz"
        "Arch_PKG.patch")
sha256sums=('dac9787951834ee2b02cff7ebf30399d2205f63747d1799cd92c843d91cf42f0'
            '35aa5787d3d415e4f173266dfacab865db88a600e8f82f98e56b725a175ba37c')

prepare() {
	patch -u $pkgname-$_gitlabcommit/Makefile -i Arch_PKG.patch
}

build() {
	cd "$pkgname-$_gitlabcommit"
	make
}

package() {
	cd "$pkgname-$_gitlabcommit"
	install -Dm755 greed    "${pkgdir}/usr/bin/greed"
	install -Dm644 greed.6  "${pkgdir}/usr/share/man/man6/greed.6"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/greed/LICENSE"
	install -Dm644 README -t "${pkgdir}/usr/share/doc/greed"
	touch greed.hs
	install -Dm666 greed.hs "${pkgdir}/usr/share/greed/greed.hs"
}
