# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=14.11
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
md5sums=('4e78b5d1f8205789af934bb7c7643908')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
