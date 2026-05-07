#
# PKGBUILD for atf
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=atf
pkgver=0.23
pkgrel=1
pkgdesc="Automated Testing Framework libs to write tests in C, C++ and shell "
arch=(i686 x86_64)
url='https://github.com/freebsd/atf'
depends=(glibc libgcc libstdc++)
license=(LicenseRef-custom)
source=(https://github.com/freebsd/atf/archive/atf-${pkgver}.zip)
sha256sums=('6a26374943d65837c26a2c2158fda0471e3ef866e260287de21e908c2f15ca82')

prepare()
{
  cd "${srcdir}/atf-atf-${pkgver}";

  autoreconf -i -s;
  ./configure --prefix=/usr --exec-prefix=/usr --libexecdir=/usr/bin --disable-developer;

  echo;
  echo "config.status:";
  echo;
  ./config.status --config;
  echo;
}

build()
{
  cd "${srcdir}/atf-atf-${pkgver}";

  make;
}

check()
{
  cd "${srcdir}/atf-atf-${pkgver}";

  make check;
}

package()
{
  cd "${srcdir}/atf-atf-${pkgver}";

  make install DESTDIR="${pkgdir}" prefix=/usr exec_prefix=/usr testsdir=/usr/bin/;
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";
}

#
# EOF
#
