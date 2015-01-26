# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Mateusz Paluszkiewcz <aifam96 at gmail dot com>

pkgname=poco
_pkgver=1.6.0
pkgver=1.6.0.0
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, complete edition with debug libraries"
arch=('i686' 'x86_64' 'armv6h')
url="http://www.pocoproject.org/"
license=('custom:boost')
depends=('unixodbc' 'libmariadbclient' 'openssl')
makedepends=('gcc' 'make' 'unixodbc' 'libmariadbclient' 'openssl' 'chrpath')
source=("http://pocoproject.org/releases/poco-${pkgver%.?}/poco-${_pkgver}-all.tar.gz")
sha256sums=('ed1be29ee413141269e7ccee861b11a2992a9f70072dbb28bec31ad432d71cab')
conflicts=('poco-dev')
provides=('poco-dev')
replaces=('poco-dev')

build()
{
  cd "${srcdir}/poco-${_pkgver}-all"
  ./configure --prefix=/usr --no-samples --no-tests
  make ODBCLIBDIR="/usr/lib"
}

package()
{
  cd "${srcdir}/poco-${_pkgver}-all"
  make ODBCLIBDIR="/usr/lib" DESTDIR="${pkgdir}" install
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/poco/LICENSE"

  chrpath -d "${pkgdir}/usr/bin/cpspc"
  chrpath -d "${pkgdir}/usr/bin/cpspcd"
  chrpath -d "${pkgdir}/usr/bin/f2cpspd"
  chrpath -d "${pkgdir}/usr/bin/f2cpsp"
}
