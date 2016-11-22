# Maintainer: Henri Chain <henri.chain at sterblue dot com>

pkgname=morse-simulator-git
pkgver=1.4.r38.gb3d6273
pkgrel=1
pkgdesc="MORSE: the Modular Open Robots Simulator Engine"
arch=('i686' 'x86_64')
url="http://morse-simulator.github.io/"
depends=('python>=3.3' 'blender>=2.65' 'python-numpy')
makedepends=('git' 'cmake')
provides=('morse-simulator')
license=('BSD')
source=('morse::git+https://github.com/morse-simulator/morse.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/morse"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/morse-build"
  cd "$srcdir/morse-build"

  cmake "$srcdir/morse" \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/morse-build"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/morse/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
