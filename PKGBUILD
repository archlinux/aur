# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.44'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'zstd' 'perl' 'postgresql-libs' 'libyaml' 'bzip2')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('b760db68316357b3ffd15ef78b642a625b78d4171b7d463442ea7acf4f7d83a4')
backup=("etc/${pkgname}/${pkgname}.conf")

build() {
  cd "${srcdir}/${pkgname}-release-${pkgver}/src"
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "${srcdir}/${pkgname}-release-${pkgver}/src"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/pgbackrest/"
  echo "# Placeholder configuration file" > "$pkgdir/etc/pgbackrest/pgbackrest.conf"
  echo "# See the documentation at https://pgbackrest.org/configuration.html" >> "$pkgdir/etc/pgbackrest/pgbackrest.conf"

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
