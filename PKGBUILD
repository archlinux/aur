# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_gitname=pgvecto.rs
pkgname=pgvecto.rs-immich-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="pgvecto.rs is a Postgres extension that provides vector similarity search functions. It is written in Rust and based on pgrx"
arch=('x86_64')
url="https://github.com/tensorchord/pgvecto.rs"
license=('Apache')
depends=('postgresql')
conflicts=(pgvector pgvecto.rs-bin pgvecto.rs pgvecto.rs-immich)
provides=("pgvecto.rs=0.2.0")

source=("${url}/releases/download/v${pkgver}/vectors-pg16_${arch}-unknown-linux-gnu_${pkgver}.zip")
sha256sums=('5037b8e4ecad2d7b96e7be84b6ed2f051bc1892427f841c5d94953e6b4cda920')

package() {
  install -Dm 755 $srcdir/usr/lib/postgresql/16/lib/vectors.so $pkgdir$(pg_config --pkglibdir)/vectors.so
  install -d $pkgdir$(pg_config --sharedir)/extension
  install -m 755 $srcdir/usr/share/postgresql/16/extension/vectors--* $pkgdir$(pg_config --sharedir)/extension/
  install -Dm 755 $srcdir/usr/share/postgresql/16/extension/vectors.control $pkgdir$(pg_config --sharedir)/extension/vectors.control
}
