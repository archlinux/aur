# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.41'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'zstd' 'perl' 'postgresql-libs' 'libyaml' 'bzip2')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('4a1f60045d7db39f491dcbbe0af5272c21e7424c040c0238b60bcaa632a9e721')
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
