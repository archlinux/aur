# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=tvision
pkgver=2.2.1_r1
pkgrel=6
pkgdesc="turbo vision library port (console interface)"
arch=(x86_64)
url="http://tvision.sourceforge.net"
license=("GPL")
depends=(gpm gcc-libs libxmu)
options=('!makeflags')
source=("http://downloads.sourceforge.net/project/tvision/UNIX/2.2.1%20CVS20100714%20Source%20and%20Debian%205.0/rhtvision_${pkgver/_r/-}.tar.gz"
	tvision-build-fix.patch tvision-gcc7.patch)
md5sums=('46b815d86bbbb2f9b112b11f63e2f5a6'
         'e24e3520bd7c6beb441716b8998b4c64'
         '2bd22d0e30db76a098e2287596a0f430')

prepare() {
  cd $pkgname
  patch -p1 <"$srcdir"/tvision-build-fix.patch
  patch -p1 -i ../tvision-gcc7.patch
}

build() {
  cd $pkgname
  export CXXFLAGS+=' -std=gnu++98'
  PERL_USE_UNSAFE_INC=1 ./configure --prefix=/usr --include=/usr/include
  make
}

package() {
  cd $pkgname
  make prefix="$pkgdir"/usr install
}
