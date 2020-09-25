# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=prc-tools-remix
pkgver=2.3.5
pkgrel=1
pkgdesc="Collection of tools supporting C and C++ programming for Palm OS"
arch=('i686' 'pentium4' 'x86_64')
url="https://github.com/jichu4n/prc-tools-remix"
license=('GPL')
# Compiling with GCC 10 currently doesn't work, so explicitly depend on GCC 9.
makedepends=('autoconf' 'automake' 'flex' 'bison' 'texinfo' 'gperf' 'make' 'gcc9')
depends=('ncurses')
source=("https://github.com/jichu4n/prc-tools-remix/archive/v${pkgver}.tar.gz")
sha256sums=('ee27b77f246882134c57b1b59e54985bce007b6d767ccf1461bbf81d78c6a60d')
# Options:
# - !makeflags: Parallel builds result in build errors.
# - !buildflags: Default build flags result in build errors.
# - !strip: Stripping cross-compiled libraries like libgcc.a results in errors.
options=('!makeflags' '!buildflags' '!strip')

build() {
  # no-op
  true
}

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

