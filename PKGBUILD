# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=21.05
pkgrel=2
pkgdesc="GCC-based toolchain for the genode framework"
arch=('x86_64')
url="http://genode.org"
license=('GPL3')
depends=('make' 'ncurses' 'ncurses5-compat-libs' 'tcl' 'expect')
makedepends=('tar')
optdepends=('byacc' 'autoconf' 'bison' 'flex' 'git' 'gperf' 'subversion' 'qemu' 'libxml2' 'libisoburn' 'e2tools' 'libisoburn' 'autogen')
provides=('genode-toolchain')
options=('!strip' 'staticlibs')

_arch="x86_64"

_filename="genode-toolchain-${pkgver}-${_arch}.tar.xz"
source=("http://downloads.sourceforge.net/project/genode/genode-toolchain/${pkgver}/${_filename}")
md5sums=('44586230e3b96715fffc2b6ace9cef18')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
