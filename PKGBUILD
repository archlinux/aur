# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Based on Fedora's perl-Mozilla-LDAP fedpkg repo
# (commit: 90a54c061c9424ac80ace1915dae2f65f71d7b3c)

pkgname=perl-mozldap
pkgver=1.5.3
pkgrel=1
pkgdesc="LDAP Perl module that wraps the OpenLDAP C SDK"
arch=(i686 x86_64)
url="http://www.mozilla.org/directory/perldap.html"
license=(GPL LGPL MPL)
depends=(mozldap openldap)
source=("ftp://ftp.mozilla.org/pub/mozilla.org/directory/perldap/releases/${pkgver}/src/${pkgname}-${pkgver}.tar.gz"
        Makefile.PL.rpm)
sha512sums=('41a6913222cde9be4dc85a6406b0a499954500a38e74e5367f150191f0ea186162b5cd66a2655240909a4d5cc9df820e349e37e73c8549f83d084d96f8f74375'
            '0cb51bc94cba8ca257607debc8eef2fc1457fe074ba45d7978767a8e22c913b28e87e4c186e05b716e5b14b7ca2990b87d57c858e5e9215f8e4252ff9520ab86')

build() {
  cd "${pkgname}-${pkgver}"

  LDAPPKGNAME=openldap \
  perl ../Makefile.PL.rpm \
    PREFIX=/usr INSTALLDIRS=vendor < /dev/null
  make OPTIMIZE="${CFLAGS}"
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  find "${pkgdir}" -name API.so -exec chmod 755 {} \;
}
