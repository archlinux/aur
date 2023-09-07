# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=surrealdb
pkgver=1.0.0_beta.11
pkgrel=2
epoch=
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL' 'MIT' 'Apache')
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
sha256sums=('a007c53f27d30bda8cc56feec356eba13b646a8fb59a97d151e3aab820429d2d' '9758e872e468ed52e3ca3fbfebe00cf688855c9f58e8ca378cd1834bcb395747')
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
