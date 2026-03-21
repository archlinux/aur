# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.11.0
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=3
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('0bfa35cd8ee3580ebda2256d30d166d66cd571bd5375d5d6d0c646bedd90f4d4')

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
