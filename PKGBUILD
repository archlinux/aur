#
# PKGBUILD: cpuid
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Past Maintainer: Jianing Yang <jianingy.yang @gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=cpuid
pkgver=20240409
pkgrel=1
pkgdesc="Linux tool to dump x86 CPUID information about the CPU(s)"
url="http://www.etallen.com/cpuid.html"
license=('GPL-2.0-only')
arch=('i686' 'x86_64')
makedepends=('perl')
depends=('glibc' 'perl')
conflicts=('msr-tools')   # extra/msr-tools seems to have /usr/bin/cpuid
groups=('system')
source=("http://www.etallen.com/$pkgname/${pkgname}-${pkgver}.src.tar.gz")
sha256sums=('5812909464e9ed13f58da2b2b8d158129e833e6696edd47012b6b361c8ccbd5d')

#
#
#
build()
{
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  # pod2man: /usr/bin/core_perl/ is not always in path - minimize error reports by setting PATH
  PATH=${PATH}:/usr/bin/core_perl/
  make || exit 1
}

#
#
#
package()
{
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
  make BUILDROOT=${pkgdir} install || exit 1
}

#
# EOF
#
