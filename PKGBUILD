pkgname=pgvecto.rs-immich-bin
pkgver=0.2.0
pkgrel=2
epoch=1
pkgdesc="pgvecto.rs is a Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx"
arch=('x86_64')
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache')
depends=('postgresql')
conflicts=(pgvector pgvecto.rs-bin pgvecto.rs pgvecto.rs-immich)
provides=("pgvecto.rs=$pkgver")

source=("${url}/releases/download/v${pkgver}/vectors-pg16_${pkgver}_amd64.deb")
sha256sums=('689d702cd65576c640bd0784dba6159c906bf25026ea2ebfdde8a8e47e3877bb')

build() {
  bsdtar -xf "${srcdir}/data."*
}

package() {
  install -Dm 755 $srcdir/usr/lib/postgresql/16/lib/vectors.so $pkgdir$(pg_config --pkglibdir)/vectors.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/usr/share/postgresql/16/extension/vectors--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/usr/share/postgresql/16/extension/vectors.control $pkgdir$(pg_config --sharedir)/extension/vectors.control
}
