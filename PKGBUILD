pkgname=heimdal
pkgdesc="Heimdal, an implementation of Kerberos and PKIX"
pkgver=7.8.0+git
pkgrel=1
url="https://www.heimdal.software/"
arch=(x86_64)
depends=(libcap-ng readline sqlite)
makedepends=(libldap perl-json)
optdepends=(libldap)
source=(
  "${pkgname}-${pkgver}::git+https://github.com/heimdal/heimdal.git"
  # "https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz"
  # "https://github.com/heimdal/heimdal/releases/download/heimdal-$pkgver/heimdal-$pkgver.tar.gz.sig"
)
sha256sums=(
  'SKIP'
  # 'fd87a207846fa650fd377219adc4b8a8193e55904d8a752c2c3715b4155d8d38'
  # 'SKIP'
)

build() {
  cd "${pkgname}-${pkgver}"
  sh autogen.sh
  ./configure \
    --prefix="/usr/heimdal" \
    --sbindir="/usr/heimdal/bin" \
    --enable-hdb-openldap-module \
    --enable-kcm \
    ;
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
