# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.36'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'zstd' 'perl' 'postgresql-libs' 'libyaml' 'bzip2')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('edfbaf319a216af17de330b966007b866782cd3ab33874e349d2da004de76feb')
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
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
