# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Co-Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.45'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'bzip2' 'lz4'
         'xz' 'zstd' 'perl' 'postgresql-libs')
makedepends=('libyaml')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('1f0a51de94df06dcaec3f44a00e4b819d562f9dc7d3705361d01736973241c93')
backup=("etc/${pkgname}/${pkgname}.conf")

build() {
  cd "${pkgname}-release-${pkgver}/src"
  ./configure --prefix="/usr"

  make
}

package() {
  cd "${pkgname}-release-${pkgver}/src"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/${pkgname}"
  echo "# Placeholder configuration file" > "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  echo "# See the documentation at https://${pkgname}.org/configuration.html" >> \
    "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
