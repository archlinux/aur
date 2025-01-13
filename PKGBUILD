pkgname=pgvecto.rs-immich-bin
pkgver=0.3.0
pkgrel=3
epoch=1
pkgdesc="pgvecto.rs is a Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx"
arch=('x86_64')
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache')
depends=('postgresql>=17' 'postgresql<18')
conflicts=(pgvector pgvecto.rs-bin pgvecto.rs pgvecto.rs-immich)
provides=("pgvecto.rs=0.2.0")
install=install

source=("${url}/releases/download/v${pkgver}/vectors-pg17_0.3.0_amd64_vectors.deb")
sha256sums=('f68349ed8d71b9d3527ebea50e0fbd8b1c02d013bef9d9a86eb3b30a63a636f5')

build() {
  bsdtar -xf "${srcdir}/data."*
}

package() {
  install -Dm 755 $srcdir/usr/lib/postgresql/17/lib/vectors.so $pkgdir$(pg_config --pkglibdir)/vectors.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/usr/share/postgresql/17/extension/vectors--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/usr/share/postgresql/17/extension/vectors.control $pkgdir$(pg_config --sharedir)/extension/vectors.control
}

# upgrading docs
# https://docs.vectorchord.ai/admin/migration.html
# https://immich.app/docs/administration/postgres-standalone/
