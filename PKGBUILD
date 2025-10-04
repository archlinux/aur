# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.9.1
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=3
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('1d0338d117a5bb5eda2dcd7456222208cb7cab90112a172cd77f6ba3c8dedf77')

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
	install -d -Dm755 docs/website/tutorial "$pkgdir"/usr/share/doc/gcli/tutorial
	install -Dm644 docs/website/tutorial/*-*.md "$pkgdir"/usr/share/doc/gcli/tutorial
}
