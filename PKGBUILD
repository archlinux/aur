# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=prc-tools-remix
pkgver=2.3.5
pkgrel=1
pkgdesc="Collection of tools supporting C and C++ programming for Palm OS"
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/jichu4n/prc-tools-remix"
license=('GPL')
# Compiling with GCC 10 currently doesn't work, so explicitly depend on GCC 9.
makedepends=('texinfo' 'gperf' 'gcc9')
depends=('ncurses')
source=("https://github.com/jichu4n/prc-tools-remix/archive/v${pkgver}.tar.gz")
sha256sums=('7f73cdb814e62e05053e4d38ca75a8dc09f225ac30b7e5ce7d7432035cfe79cd')
# Options:
# - !makeflags: Parallel builds result in build errors.
# - !buildflags: Default build flags result in build errors.
options=('!makeflags' '!buildflags')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Environment variables:
  # - CC: Compiling with GCC 10 currently doesn't work, so using GCC 9 here.
  # - SHELL: Compilation can fail if the user has a different default shell
  #   like fish.
  env \
    CC=gcc-9 \
    CXX=g++-9 \
    SHELL=/bin/sh \
    ./tools/build.sh "${pkgdir}"
}

# vim:set ts=2 sw=2 et:

