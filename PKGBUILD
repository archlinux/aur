# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/razercommander

pkgname=razercommander-git
pkgver=1.2.0.r31.g760e251
pkgrel=1
pkgdesc='Razer device manager for Linux'
arch=('any')
url='https://github.com/gabmus/razercommander'
license=('GPL3')
depends=('python-razer' 'gtk3>=3.14' 'python')
makedepends=('git' 'meson')
install=razercommander-git.install
provides=('razercommander')
conflicts=('razercommander')
source=("razercommander::git+https://github.com/gabmus/razercommander")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/razercommander"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/razercommander"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --buildtype release ..
  ninja
}

package() {
  cd "$srcdir/razercommander"
  cd build
  DESTDIR="$pkgdir" ninja install
}
