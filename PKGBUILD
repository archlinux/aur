# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Michael Rasmussen <michael@michaelsnet.us>
# Contributor: Matt Kemp <matt@mattikus.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=mod_gnutls
pkgver=0.7.5
pkgrel=1
pkgdesc="Apache module for the GnuTLS library"
arch=('i686' 'x86_64')
url="http://modgnutls.sourceforge.net/"
license=('Apache')
depends=('apache>=2.0.42' 'gnutls>=2.12.6')
optdepends=('aprmemcache>=0.7.0')
install=${pkgname}.install
source=("http://mod.gnutls.org/downloads/${pkgname}-${pkgver}.tar.bz2"{,.asc})
md5sums=('6129006fa689d241fceeae6fd4dcf9d6'
         'SKIP')

#Thomas Klute <thomas2.klute@uni-dortmund.de>
validpgpkeys=('B471C74C72A7F6EC9FFA46E361459C5287768C53')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -ir 's/@${APXS_BIN} -i -n gnutls mod_gnutls.so/mkdir -p $(DESTDIR)$(AP_LIBEXECDIR)\n\t@${APXS_BIN} -i -S LIBEXECDIR=$(DESTDIR)$(AP_LIBEXECDIR) -n gnutls mod_gnutls.so/' src/Makefile
    make DESTDIR="${pkgdir}/" install
}
