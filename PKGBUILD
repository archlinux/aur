# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=surrealdb
pkgver=1.0.0_beta.7
pkgrel=1
epoch=
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL' 'MIT' 'Apache')
groups=()
depends=('curl')
makedepends=('rust')
checkdepends=('rust')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver//_/-}/LICENSE" "https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('3012620080caa47eb9d8fd490044274b9b71eda7fc48c9084914a5470800a868' '21bdc44686a656c3f96415f398ddfcc1be68c48d0677a5771bb092092d626589') validpgpkeys=()

build() {
	cd "$pkgname-${pkgver//_/-}"
	make build
}

check() {
	cd "$pkgname-${pkgver//_/-}"
	make -k check
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$pkgname-${pkgver//_/-}"
	install -Dm755 target/release/surreal "$pkgdir/usr/bin/surreal"
}
