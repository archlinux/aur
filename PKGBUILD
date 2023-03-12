pkgname=heimdal
pkgdesc="Heimdal, an implementation of Kerberos and PKIX"
pkgver=7.8.0
pkgrel=1
url="https://www.heimdal.software/"
arch=(x86_64)
depends=(libcap-ng readline sqlite)
makedepends=(libldap perl-json)
optdepends=(libldap)
source=("https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz"
        "https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz.sig")
sha256sums=('fd87a207846fa650fd377219adc4b8a8193e55904d8a752c2c3715b4155d8d38'
            'SKIP')
validpgpkeys=('E65941B71CF3C459A34FA89C45E7572A28CD8CC8'
              'FB925C7AFA000F52B4BBD1ED9A077911BB7DC320')

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
