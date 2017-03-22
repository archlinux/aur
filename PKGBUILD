# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=alpine
pkgver=2.21
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Apache licensed PINE mail user agent"
url="http://patches.freeiz.com/alpine/"
license=("APACHE")
depends=("libldap" "krb5" "gettext")
optdepends=("aspell: for spell-checking support"
	    "hunspell: for spell-checking support"
            "topal: glue program that links GnuPG and alpine")
provides=("pine")
conflicts=("pine" "re-alpine")
replaces=("pine")
options=("!makeflags")
source=(http://patches.freeiz.com/${pkgname}/release/src/${pkgname}-${pkgver}.tar.xz)
        #ftp://ftp.cac.washington.edu/${pkgname}/${pkgname}.tar.bz2
        #http://patches.freeiz.com/${pkgname}/patches/${pkgname}-${pkgver}/all.patch.gz
        #topal-1.patch
        #topal-2.patch)
md5sums=("02dad85c1be80ce020206f222ecf5ac8")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# User compile time patches
# - Eduardo Chappa patches
#  patch -p1 < ../all.patch
# - Phil Brooke patches (optional topal support)
  #patch -p1 < ../topal-1.patch
  #patch -p1 < ../topal-2.patch


# Configure Alpine
  LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
  --without-passfile --without-tcl --disable-shared \
  --with-system-pinerc=/etc/${pkgname}.d/pine.conf \
  --with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed

# Build Alpine
  make
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

# Install Alpine
  make DESTDIR="${pkgdir}" install
}
