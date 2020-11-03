#
# PKGBUILD: vasm
#
# Maintainer: Uffe Jakobsen <_microtop_-at-_starion_-_dot_-_dk_>
#

_pkgver="1_8i"

pkgname=vasm
pkgver=1.8i
pkgrel=2
pkgdesc="Portable and retargetable 6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80 assembler."
arch=('i686' 'x86_64')
url="http://sun.hasenbraten.de/vasm/"
license=('custom')
depends=()
#makedepends=('texinfo')
#source=(http://sun.hasenbraten.de/vasm/release/vasm.tar.gz) # latest unversioned source url
#source=(http://server.owl.de/~frank/tags/${pkgname}${_pkgver}.tar.gz)
source=(http://phoenix.owl.de/tags/${pkgname}${_pkgver}.tar.gz)
md5sums=('889d409503d8b4f5e41a26a90594fad2')


CPU_LIST="6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80"
SYNTAX_LIST="std madmac mot oldstyle" # test
OUTPUT_LIST="aout bin elf hunk test tos vobj"

prepare()
{
  cd "${srcdir}/${pkgname}"
}

build()
{
  cd "${srcdir}/${pkgname}"
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      make CPU=${CPU} SYNTAX=${SYNTAX}
    done
  done

  #make doc/vasm.pdf # some users report texi problems (1.8i)
  #make doc/vasm.html # currently fails due to missing html file (1.8i)
}

package()
{
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      cp "vasm${CPU}_${SYNTAX}" "${pkgdir}/usr/bin/"
    done
  done

  #mkdir -p "${pkgdir}/usr/share/doc/vasm/"
  #install -m644 doc/vasm.pdf "${pkgdir}/usr/share/doc/vasm/"
}

#
# EOF
#
