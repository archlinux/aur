# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=surrealdb
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
groups=()
depends=('curl' 'clang')
makedepends=('rust')
checkdepends=('rust')
optdepends=()
provides=()
conflicts=('surrealdb-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE" "${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('a007c53f27d30bda8cc56feec356eba13b646a8fb59a97d151e3aab820429d2d' 'd2232cba6e8e58bf97f0379d0397d24be15fd10aae1241c28846d3bff1304987')
validpgpkeys=()

build() {
	cd "$pkgname-${pkgver//_/-}" || exit
	make build
}

check() {
	cd "$pkgname-${pkgver//_/-}" || exit
	make -k check
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}" || exit
	install -Dm755 target/release/surreal "$pkgdir/usr/bin/surreal"
}
