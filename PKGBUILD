# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Mateusz Paluszkiewcz <aifam96 at gmail dot com>
# Contributor: Christopher Reimer <vdr4arch at creimer dot net>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=poco
pkgver=1.7.5
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition with debug libraries"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('libmariadbclient' 'openssl' 'unixodbc')
makedepends=('chrpath')
source=("http://pocoproject.org/releases/poco-${pkgver%p?}/poco-${pkgver}-all.tar.bz2")
sha256sums=('b2237e5e207184285433188a144acaca4a0c11cad64b0f780571fe8ddd209ae9')
conflicts=('poco-dev')
provides=('poco-dev')
replaces=('poco-dev')

build()
{
  cd "${srcdir}/poco-${pkgver}-all"
  ./configure --prefix=/usr --no-samples --no-tests --unbundled
  make ODBCLIBDIR="/usr/lib"
}

package()
{
  cd "${srcdir}/poco-${pkgver}-all"
  make ODBCLIBDIR="/usr/lib" DESTDIR="${pkgdir}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/poco/LICENSE"

  chrpath -d "${pkgdir}/usr/bin/cpspc"
  chrpath -d "${pkgdir}/usr/bin/cpspcd"
  chrpath -d "${pkgdir}/usr/bin/f2cpspd"
  chrpath -d "${pkgdir}/usr/bin/f2cpsp"
}
