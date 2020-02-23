# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

pkgname=dynomite
pkgver=0.6.21
upstream_pkgrel=-rc2
pkgrel=3
pkgdesc="Dynomite is a thin, distributed dynamo layer for different storage engines and protocols"
arch=('i686' 'x86_64')
url="https://github.com/Netflix/dynomite"
license=('Apache-2.0')
conflicts=('dynomite')
provides=('dynomite')
source=(
  "https://github.com/Netflix/${pkgname}/archive/v${pkgver}${upstream_pkgrel}.tar.gz"
)
sha256sums=(
  '37ac75726bc139db1063b8ffbfcd42dc83e9dd71f35ffaabf973900a0cb3e597'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}${upstream_pkgrel}"
  autoreconf -fvi
  ./configure --prefix=/usr \
    --sbindir='${exec_prefix}/bin' \
    --sysconfdir=/etc/dynomite \
    --datarootdir='${exec_prefix}/share'
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}${upstream_pkgrel}"
  HOME="${srcdir}/testhome" make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}${upstream_pkgrel}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
