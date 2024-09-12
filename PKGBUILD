#
# Maintainer: Uffe Jakobsen <_microtop_|_at_|_starion_|_dot_|_dk_>
#
pkgname=acme-upstream
_pkgname=acme
pkgver=0.97
pkgrel=2
pkgdesc="Cross-assembler for MOS 6502, 65C02 and 65816 CPUs - SourceForge upstream release"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/acme-crossass/"
#url="https://github.com/uffejakobsen/acme"
source=(https://github.com/uffejakobsen/acme/archive/${pkgver}.tar.gz)
#url="http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme"
#source=(http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/${pkgname}/current/${_pkgname}${pkgver}src.tar.bz2)
license=('GPL-2.0-only')
depends=('glibc')
provides=('acme')
conflicts=('acme' 'acme-git')
sha256sums=('5e879065c8d65c2f246152d23ee837e535d0f7461c0df86882a5bd1e488f44f6')

build()
{
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  make || return 1
}

package()
{
  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -D -m755 src/acme ${pkgdir}/usr/bin/acme
  #
  install -D -d ${pkgdir}/usr/share/acme
  cp -R ACME_Lib docs examples "${pkgdir}/usr/share/acme/"
  #
  install -D -d ${pkgdir}/usr/share/doc
  ln -s ../acme/docs "${pkgdir}/usr/share/doc/acme"
}

#
# EOF
#
