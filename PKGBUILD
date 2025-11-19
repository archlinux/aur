# Maintainer: xiretza <xiretza+aur@gmail.com>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
#
pkgname=xc3sprog-svn
pkgver=0.r795
pkgrel=2
pkgdesc="Utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs with the Xilinx Parallel Cable and other JTAG adapters"
arch=('i686' 'x86_64')
url="http://xc3sprog.sourceforge.net"
license=('GPL-2.0-only')
depends=('libusb' 'libusb-compat' 'libftdi' 'libftdi-compat' 'libftd2xx')
makedepends=('cmake' 'subversion')
provides=('xc3sprog')
conflicts=('xc3sprog')
source=(svn+http://svn.code.sf.net/p/xc3sprog/code/trunk)
md5sums=('SKIP')

pkgver()
{
  cd "${srcdir}/trunk"

  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
}

prepare()
{
  cd "${srcdir}/trunk"
}

build()
{
  cd "${srcdir}/trunk"

  #  -DCMAKE_BUILD_TYPE=Release
  cmake -S . -B _build.out \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake --build _build.out
}

check()
{
  cd "${srcdir}/trunk"
}

package()
{
  cd "${srcdir}/trunk"

  DESTDIR="${pkgdir}" cmake --install _build.out --prefix=/usr
  install -Dm0644 xc3sprog.1 "${pkgdir}/usr/share/man/man1/xc3sprog.1"
}

#
# EOF
#
