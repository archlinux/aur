pkgname=vectorchord-immich
pkgver=0.5.3
pkgrel=2
pkgdesc='The latest version of VectorChord compatible with immich-server.'
arch=('x86_64' 'aarch64')
url='https://github.com/tensorchord/VectorChord'
license=('AGPL-3.0-only')
depends=('postgresql' 'pgvector')
makedepends=('cargo' 'clang')
provides=("vectorchord=$pkgver")
source=("VectorChord-$pkgver.tar.gz::https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('38e20bd299d15a9ffd6464e649f630282a26df7f1a9df3cefe729634e3e1545d')

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
