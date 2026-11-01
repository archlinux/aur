# Maintainer: Werenter <werenter@cock.li>

pkgname=gcli
pkgver=2.14.0
pkgdesc="A CLI for Github, Gitlab and Gitea written in C"
pkgrel=1
arch=('any')
license=('BSD-2-Clause')
url="https://github.com/herrhotzenplotz/gcli"
depends=('curl')
source=("https://herrhotzenplotz.de/gcli/releases/gcli-$pkgver/gcli-$pkgver.tar.bz2")
sha256sums=('252520788f4de48dee006aa6793b004d3f80396ff4fa7398d1c56f762676806e')

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
