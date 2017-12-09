# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=alpine
pkgver=2.21
pkgrel=99
pkggit=0473711
arch=("i686" "x86_64")
pkgdesc="Apache licensed PINE mail user agent"
url="http://repo.or.cz/alpine.git"
license=("APACHE")
depends=("libldap" "krb5" "gettext")
optdepends=("aspell: for spell-checking support"
	    "hunspell: for spell-checking support"
            "topal: glue program that links GnuPG and alpine")
provides=("pine")
conflicts=("pine" "re-alpine")
replaces=("pine")
options=("!makeflags")
source=(http://repo.or.cz/alpine.git/snapshot/04737118aa1d9ad3db63fb1064267187ae871856.tar.gz)
md5sums=("b72fc6dabf93c614cab333265581362e")

build() {
  cd "${srcdir}/${pkgname}-${pkggit}"

# Configure Alpine
  LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
  --without-passfile --without-tcl --disable-shared \
  --with-system-pinerc=/etc/${pkgname}.d/pine.conf \
  --with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed

# Build Alpine
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkggit}"

# Install Alpine
  make DESTDIR="${pkgdir}" install
}
