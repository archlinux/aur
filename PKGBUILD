# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=23.05
pkgrel=1
pkgdesc="GCC-based toolchain for the genode framework"
arch=('x86_64')
url="https://genode.org"
license=('GPL3')
depends=('make' 'ncurses' 'ncurses5-compat-libs' 'tcl' 'expect')
makedepends=('tar')
optdepends=('byacc' 'autoconf' 'bison' 'flex' 'git' 'gperf' 'subversion' 'qemu' 'libxml2' 'libisoburn' 'e2tools' 'libisoburn' 'autogen')
provides=('genode-toolchain')
options=('!strip' 'staticlibs')

_arch="x86_64"

_filename="genode-toolchain-${pkgver}.tar.xz"
source=("https://downloads.sourceforge.net/project/genode/genode-toolchain/${pkgver}/${_filename}")
sha1sums=('5aa01b05c0f5f69c410b1dc5c334306a64d4fd91')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
