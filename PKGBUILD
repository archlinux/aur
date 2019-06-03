# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=19.05
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

_filename="genode-toolchain-${pkgver}-${_arch}.tar.xz"
source=("http://downloads.sourceforge.net/project/genode/genode-toolchain/${pkgver}/${_filename}")
md5sums=('90f83ee84930377aa554e9db488a290d')
[ "$CARCH" == 'i686' ] && md5sums=('bf6a20eb248c8a5a37ba4be733eaa6ae')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
