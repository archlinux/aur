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
sha256sums=('9b6b79d56722e76a9a24f2f459a530545d0c7407349c4e9a7ee3084dad39c733')
# Options:
# - !makeflags: Parallel builds result in build errors.
# - !buildflags: Default build flags result in build errors.
# - !strip: Stripping breaks static libs installed by this package.
options=('!makeflags' '!buildflags' '!strip')

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

