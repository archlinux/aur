# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=svrcore
pkgver=4.0.4
pkgrel=4
pkgdesc="Secure PIN handling using NSS crypto"
arch=(i686 x86_64)
license=(MPL)
url="https://wiki.mozilla.org/LDAP_C_SDK" # TODO there is a mention of it, but does anyone really know?
depends=(nspr nss)
options=(!libtool)
source=("ftp://ftp.mozilla.org/pub/mozilla.org/directory/${pkgname}/releases/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('4a63e2618ef8f508e71adf212eefae56e3c9d9898b924f405399bb99793de57bd178a3417f9e837c474e7960b6eb8a3cbe775b420c8fecbd974e89b4196b78fc')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static
  if [[ "$CARCH" = 'x86_64' ]]; then
    make USE64=1
  else
    make
  fi
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install 
}
