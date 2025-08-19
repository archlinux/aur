# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.8.0
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=2
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('e1893267c66912890703cc100160409296ab2f1d3a322322da943971160bccea')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# license exception
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/gcli/LICENSE
	install -Dm644 Changelog.md "$pkgdir"/usr/share/doc/gcli/Changelog.md
	install -d -Dm644 docs/website/tutorial "$pkgdir"/usr/share/doc/gcli/tutorial
	install -Dm644 docs/website/tutorial/*-*.md "$pkgdir"/usr/share/doc/gcli/tutorial
}
