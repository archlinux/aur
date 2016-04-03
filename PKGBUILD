# Maintainer:  Alain Kalker <a.c.kalker@gmail.com>
_pkgname=fluxus
pkgname=${_pkgname}-git
pkgver=v0.17rc5.r224.gd06cb52
pkgrel=1
pkgdesc="A 3D game engine for livecoding worlds into existence"
arch=('i686' 'x86_64')
url="http://www.pawfal.org/fluxus/"
license=('GPL')
depends=('ode' 'fftw' 'liblo' 'glew' 'jack' 'freeglut' 'openal' 'racket')
makedepends=('git' 'scons')
provides=('fluxus')
conflicts=('fluxus')
source=(git://git.savannah.nongnu.org/fluxus.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  # Fix boot script path
  sed -i -e 's,/usr/local,/usr,' src/Interpreter.cpp
}

build() {
  cd "$srcdir/$_pkgname"

  scons Prefix=/usr RacketPrefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"

  scons DESTDIR="$pkgdir/" Prefix=/usr RacketPrefix=/usr install
}

# vim:set ts=2 sw=2 et:
