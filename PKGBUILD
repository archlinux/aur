pkgname=vectorchord
pkgver=1.1.0
pkgrel=1
pkgdesc='Scalable, fast, and disk-friendly vector search in Postgres, successor to pgvecto.rs'
arch=('x86_64' 'aarch64')
url='https://github.com/tensorchord/VectorChord'
license=('AGPL-3.0-only OR Elastic-2.0')
depends=('postgresql' 'pgvector')
makedepends=('cargo' 'clang')
source=("VectorChord-$pkgver.tar.gz::https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dea94f80844294b4b1731dd9ad8da28b008fda8b36919a34adc75c838de457f2')

prepare(){
	cd "VectorChord-$pkgver"
	cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
	cd "VectorChord-$pkgver"
	CFLAGS+=" -ffat-lto-objects"
  	make build
}

package() {
	cd "VectorChord-$pkgver"
	make DESTDIR="${pkgdir}" install
}
