# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brodi <me@brodi.space>

pkgname=aretext
pkgver=1.6.0
pkgrel=1
pkgdesc="Minimalist text editor with vim-compatible key bindings"
arch=(x86_64)
url="https://github.com/aretext/aretext"
license=("GPL-3.0-only")
makedepends=("go")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b98d35073d893a2fd889986301cb9647a37d923b6b25fc6bc6c5b7bb54282ca')

build() {
	cd ${pkgname}-${pkgver}
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		.
}

package() {
	cd ${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
