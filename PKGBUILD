# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>
_main_name=frcmake
pkgname=$_main_name-git
pkgver=46.c66f929
pkgrel=2
pkgdesc="Some CMake stuff for use with the VxWorks 6.3 GCC Toolchain"
arch=(any)
provides=('frcmake')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
depends=('wput' 'cmake')
options=('!strip' 'libtool' '!zipman')
conflicts=('vxworks-gcc-toolchain-bin' 'frcmake')
source=("git+http://bitbucket.org/frc-cpp11/$_main_name")
sha512sums=('SKIP')

pkgver() {
  cd $_main_name
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_main_name"
  mkdir build && cd build
  cmake ..
  make ${MAKEFLAGS} || return 1
}

package() {
  cd "$srcdir/$_main_name/build"
  make ${MAKEFLAGS} DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/bin/frcmake $pkgdir/usr/bin/frcmake-wrs
}

# vim:set ts=2 sw=2 et:
