# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=genode-toolchain-bin
pkgver=25.05
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

_filename="genode-toolchain-${pkgver}-ubuntu-24.04.tar.xz"
source=("https://github.com/genodelabs/genode/releases/download/${pkgver}/${_filename}")
sha256sums=('6cab8e5f4490399a296a73b01695d5fb055a40f6ac04d61a3f7a7344003eb739')
noextract=(${_filename})

package() {
  cd ${pkgdir}
  tar xf "${srcdir}/${_filename}"
  tar tvf "${srcdir}/${_filename}" | grep "link to" | awk '{print "ln -sf /" $9 " ." $6 | "/bin/bash"}'
}
