pkgname=vectorchord
pkgver=1.0.0
pkgrel=2
pkgdesc='Scalable, fast, and disk-friendly vector search in Postgres, successor to pgvecto.rs'
arch=('x86_64' 'aarch64')
url='https://github.com/tensorchord/VectorChord'
license=('AGPL-3.0-only')
depends=('postgresql' 'pgvector')
makedepends=('cargo' 'clang')
source=("VectorChord-$pkgver.tar.gz::https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('716d2527d28f4b980c8d1f1e83e140df0b095d09636539a762eb4b6472d4623c')

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
