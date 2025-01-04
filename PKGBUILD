pkgname=pgvecto.rs-immich-bin
pkgver=0.3.0
pkgrel=1
epoch=1
pkgdesc="pgvecto.rs is a Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx"
arch=('x86_64')
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache')
depends=('postgresql')
conflicts=(pgvector pgvecto.rs-bin pgvecto.rs pgvecto.rs-immich)
provides=("pgvecto.rs=0.2.0")
install=install

source=("${url}/releases/download/v${pkgver}/vectors-pg16_${arch}-unknown-linux-gnu_${pkgver}.zip")
sha256sums=('03038abc2ed7f13a80b72d140a06343079d198f17ae1635e418dd0d5881aaede')

package() {
  install -Dm 755 $srcdir/vectors.so $pkgdir$(pg_config --pkglibdir)/vectors.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/vectors--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/vectors.control $pkgdir$(pg_config --sharedir)/extension/vectors.control
}
