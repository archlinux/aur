# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Kyle Keen
# Contributor: simongmzlj
pkgname=greed
pkgver=4.4
_gitlabcommit=ba2b0e0c1503aff795aba56ef182fe850233f743
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
sha256sums=('977159107376c589cabfbee38a24ad2d624280f09bac72dbacefead43b86a721'
            'ce9de7f2abaf6306800840afafbcac2b2deda42353f857ec76ab0103c087feaf')

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
	install -Dm644 README.adoc -t "${pkgdir}/usr/share/doc/greed"
	touch greed.hs
	install -Dm666 greed.hs "${pkgdir}/usr/share/greed/greed.hs"
}
