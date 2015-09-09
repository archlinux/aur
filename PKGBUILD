# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabiano Furtado - fusca < fusca14 *at* gmail *dot* com >

set -u
pkgname='pev'
pkgver='0.70'
pkgrel='3'
pkgdesc='Command line based tool for Windows portable executable PE32+ file analysis'
arch=('i686' 'x86_64')
url='http://pev.sourceforge.net/'
license=('GPL')
depends=('glibc' 'openssl' 'pcre')
#source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('250396a06930d60a92e9bc86d7afb543d899ba12c007d1be5d09802a02908202')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}"
  # Changes to correct hard coded destdir in Makefiles (bad practice from upstream)
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/bin|\$(DESTDIR)\$(PREFIX)/bin|" src/Makefile
  #sed -i "s|/usr/share/pev|${pkgdir}/usr/share/pev|" src/Makefile
  #sed -i "s|/usr/share/man/man1|${pkgdir}/usr/share/man/man1|" src/Makefile
  #sed -i "s|\$(DESTDIR)/\$(PREFIX)/lib|\$(DESTDIR)\$(PREFIX)/lib|" lib/libpe/Makefile

  #sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" src/Makefile
  #sed -i "s|prefix = /usr|prefix = ${pkgdir}/usr|" lib/libpe/Makefile
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"
  make datarootdir="${pkgdir}/usr/share" datadir="${pkgdir}/usr/share" DESTDIR="${pkgdir}" install
  set +u
}
set +u
