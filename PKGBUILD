#
# PKGBUILD: cpuid
#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Past Maintainer: Jianing Yang <jianingy.yang @gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=cpuid
pkgver=20250316
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
sha256sums=('3ef849e964a027c9575470c4dcc80944b4cb6ac214aca02feec6b249308fa0f5')

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
