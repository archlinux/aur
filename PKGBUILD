# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/ardhue

pkgname=ardhue-git
pkgver=b1c6819
pkgrel=1
pkgdesc='Interface to control ArdHue Arduino based digital RGB system'
arch=('any')
url='https://gitlab.com/gabmus/ardhue'
license=('GPL3')
depends=('python-pyserial' 'gtk3>=3.14' 'python')
makedepends=('git' 'meson')
provides=('ardhue')
conflicts=('ardhue')
source=("ardhue::git+https://gitlab.com/gabmus/ardhue")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ardhue"
  git describe --always --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/ardhue"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/ardhue"
  cd build
  DESTDIR="$pkgdir" ninja install
}
