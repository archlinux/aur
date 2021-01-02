pkgname=heimdal
pkgdesc="Heimdal, an implementation of Kerberos and PKIX"
pkgver=7.7.0
pkgrel=1
url="https://www.heimdal.software/"
arch=(x86_64)
depends=(libcap-ng readline sqlite)
makedepends=(libldap)
optdepends=(libldap)
source=("https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz"
        "https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz.asc")
sha256sums=('f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b'
            'SKIP')
validpgpkeys=('E65941B71CF3C459A34FA89C45E7572A28CD8CC8')

build() {
  cd heimdal-$pkgver
  ./configure \
    --prefix="/usr/heimdal" \
    --sbindir="/usr/heimdal/bin" \
    --enable-hdb-openldap-module \
    --enable-kcm \
    ;
  make
}

package() {
  cd heimdal-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
