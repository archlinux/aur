#
# Maintainer: Uffe Jakobsen <_microtop_|_at_|_starion_|_dot_|_dk_>
#

pkgname=acme-upstream-git
_pkgname=acme
pkgver=r376.bc5bc2a
pkgrel=1
#pkgdesc="Cross-assembler for MOS 6502, 65C02 and 65816 CPUs - "
pkgdesc="Cross-assembler for MOS 6502, 6510, 4502, 65816, 65C02, 65CE02, R65C02, W65C02 and C64DTV2 CPUs - SourceForge upstream repo"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/acme-crossass/"
#url="https://github.com/uffejakobsen/acme"
license=('GPL-2.0-only')
source=(git+https://github.com/uffejakobsen/acme.git)
#url="http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme"
#source=(http://www.esw-heim.tu-clausthal.de/~marco/smorbrod/${pkgname}/current/${_pkgname}${pkgver}src.tar.bz2)
makedepends=('git')
conflicts=('acme' 'acme-git')
provides=('acme')
sha256sums=('SKIP')

pkgver()
{
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}/src"
  make || return 1
}

package()
{
  cd "${srcdir}/${_pkgname}/"
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
