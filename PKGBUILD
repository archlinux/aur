# Maintainer: Darks <darks@middleearth.fr>

_basename="gint"
pkgname="${_basename}-git"
pkgver=2.3.1.r0.g7e1becb
pkgrel=1
pkgdesc='Alternative library and kernel for add-in development on fx-9860G and fx-CG50'
url='https://gitea.planet-casio.com/Lephenixnoir/gint'
arch=('i686' 'x86_64')
depends=('fxsdk' 'sh-elf-gcc-casio' 'python-pillow')
makedepends=('git')
source=("${pkgname}::git+https://gitea.planet-casio.com/Lephenixnoir/${_basename}.git")
sha256sums=("SKIP")
options=("!strip")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname}"

  # Ensure clean builds
  fxsdk build-fx -c
  fxsdk build-cg -c
}

build() {
  cd "$srcdir/${pkgname}"
  fxsdk build-fx
  fxsdk build-cg
}

package() {
  cd "$srcdir/${pkgname}"
  fxsdk build-fx DESTDIR="$pkgdir" install
  fxsdk build-cg DESTDIR="$pkgdir" install
}
