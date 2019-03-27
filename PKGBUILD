# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=dangerdeep
pkgver=0.3.0
pkgrel=10
pkgdesc='Submarine simulator'
arch=('x86_64')
url='https://dangerdeep.sourceforge.net'
license=('GPL')
depends=('dangerdeep-data' 'fftw' 'glu' 'libgl' 'sdl_image' 'sdl_mixer' 'sdl_net')
makedepends=('addinclude>=1.0' 'mesa' 'scons' 'setconf')
source=("https://downloads.sourceforge.net/sourceforge/dangerdeep/dangerdeep-$pkgver.tar.gz")
sha256sums=('bdab6b9b1c2b5f8e618f5c346965ec1f48c9edc9bff1d4f5ff7c8d235464283f')

prepare() {
  cd "$pkgname-$pkgver"

  addinclude src/bspline_test.cpp cstdlib
  addinclude -+ src/convoy.h memory
  addinclude src/date.cpp stdio.h
  addinclude src/date.cpp stdlib.h
  addinclude -t src/faulthandler.h unistd
  addinclude src/filehelper.cpp stdio.h
  addinclude src/ocean_wave_generator.h stdlib
  addinclude -+ src/ptrlist.h memory
  addinclude -+ src/ptrvector.h memory
  addinclude src/widget.cpp algorithm

  setconf SConstruct ccflags=\'"$(pkg-config --cflags sdl x11) -w"\'
}

build() {
  cd "$pkgname-$pkgver"

  scons datadir=/usr/share/dangerdeep
}

package() {
  cd "$pkgname-$pkgver"

  scons installbindir="$pkgdir/usr/bin" datadir=/usr/share/dangerdeep install
}

# vim: ts=2 sw=2 et:
