pkgname=vectorchord-immich
pkgver=1.1.1
pkgrel=1
pkgdesc='The latest version of VectorChord compatible with immich-server.'
arch=('x86_64' 'aarch64')
url='https://github.com/tensorchord/VectorChord'
license=('AGPL-3.0-only OR Elastic-2.0')
depends=('postgresql' 'pgvector')
makedepends=('cargo' 'clang')
provides=("vectorchord=$pkgver")
source=("VectorChord-$pkgver.tar.gz::https://github.com/tensorchord/VectorChord/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d70b5595bfc852f1f24c05c0a40272e7deecbb0ddf8ffdddec5afa42c2392b1e')

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
