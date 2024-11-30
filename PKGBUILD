# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Brodi <me@brodi.space>

pkgname=aretext
pkgver=1.4.0
pkgrel=1
pkgdesc="Minimalist text editor with vim-compatible key bindings"
arch=(x86_64)
url="https://github.com/aretext/aretext"
license=("GPL-3.0-only")
makedepends=("go")
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bfad6f3ac0d26c07776f3cd0e73093392087e33629b2885956c394a3a42db757')

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
