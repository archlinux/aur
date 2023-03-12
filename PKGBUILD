# Maintainer: ryester19 <ryester19 at rbox dot co>
pkgname=pg_squeeze
pkgver=1.5.0
pkgrel=1
pkgdesc="A PostgreSQL extension for automatic bloat cleanup"
arch=(i686 x86_64)
url="https://github.com/cybertec-postgresql/pg_squeeze"
license=('custom')
depends=('postgresql')
makedepends=('clang')
source=("https://github.com/cybertec-postgresql/pg_squeeze/archive/refs/tags/REL${pkgver//./_}.tar.gz")
sha256sums=('06313282414dc0d3e29a01272145b0e402d89bd90298f37f86f86f2ef2ddcd3a')

build() {
  cd "$srcdir/$pkgname-REL${pkgver//./_}"
  make
}

package() {
  cd "$srcdir/$pkgname-REL${pkgver//./_}"
  install -Dm 755 pg_squeeze.so -t "$pkgdir/usr/lib/postgresql/"
  install -Dm 644 *.bc -t "$pkgdir/usr/lib/postgresql/bitcode/pg_squeeze/"
  install -Dm 644 pg_squeeze.control -t "$pkgdir/usr/share/postgresql/extension/"
  install -Dm 644 *.sql -t "$pkgdir/usr/share/postgresql/extension/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/pg_squeeze/"
}
