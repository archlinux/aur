# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arvid Norlander <anmaster A_T tele2 d_o_t (ccTLD for Sweden, which is se)>

pkgname=c-intercal
pkgver=0.31
pkgrel=1
pkgdesc='A compiler for the INTERCAL language. INTERCAL is the original esoteric language, a farrago of features that will test the mettle of any programmer and bend the minds of most. Includes a compiler, debugger, and sample code.'
arch=('x86_64' 'i686')
url='https://gitlab.com/esr/intercal'
license=('GPL')
depends=('sh')
options=('staticlibs')
source=("git+https://gitlab.com/esr/intercal#tag=0.31")
sha256sums=('SKIP')

build() {
  cd intercal/buildaux
  ./regenerate-build-system.sh
  cd ..
  mkdir -p build
  cd build

  # https://gitlab.com/esr/intercal/-/issues/4
  # gcc 10 switched the default from -fcommon to -fno-common
  CFLAGS=-fcommon ../configure "--prefix=/usr"
  make
}

package() {
  cd intercal/build

  make "DESTDIR=$pkgdir" install
}

# vim:set ts=2 sw=2 et:
