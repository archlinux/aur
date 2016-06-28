# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=16.05
pkgrel=1
pkgdesc="GCC-based toolchain for the genode framework"
arch=('i686' 'x86_64')
url="http://genode.org"
license=('GPL2')
makedepends=('tar')
provides=('genode-toolchain')
options=('!strip' 'staticlibs')

_arch="x86_64"
[ "$CARCH" == 'i686' ] && _arch="x86_32"

_filename="genode-toolchain-${pkgver}-${_arch}.tar.bz2"
source=("http://dfn.dl.sourceforge.net/project/genode/genode-toolchain/${pkgver}/${_filename}")
md5sums=('f02280f676cd0ac602e2413f4ae31d46')
[ "$CARCH" == 'i686' ] && md5sums=('7846c41758f4fb8dff639e784652ee71')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
