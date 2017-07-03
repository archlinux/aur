#
# vasm PKGBUILD
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>

_pkgver="1_8"

pkgname=vasm
pkgver=1.8
pkgrel=1
pkgdesc="Portable and retargetable 6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80 assembler."
arch=('i686' 'x86_64')
url="http://sun.hasenbraten.de/vasm/"
license=('custom')
depends=()
source=(http://server.owl.de/~frank/tags/${pkgname}${_pkgver}.tar.gz
	patch-cpus_test_cpu.c.patch)
md5sums=('8ac42c171c84d1460119f28cca601467'
         '46a0705ebc82b4290dc73acdcc53fc73')


CPU_LIST="6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80"
SYNTAX_LIST="std madmac mot oldstyle" # test
OUTPUT_LIST="aout bin elf hunk test tos vobj"

prepare()
{
  cd ${srcdir}/${pkgname}
  patch -p0 -i "${srcdir}/patch-cpus_test_cpu.c.patch"
}

build()
{
  cd ${srcdir}/${pkgname}
  #make doc/vasm.pdf
  #make doc/vasm.html
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      make CPU=${CPU} SYNTAX=${SYNTAX}
    done
  done
}

package()
{
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      cp vasm${CPU}_${SYNTAX} ${pkgdir}/usr/bin
    done
  done
}

#
# EOF
#
