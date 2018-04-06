# Maintainer: Jonas Strassel <info@jonas-strassel.de>

pkgname=scantailor-advanced-git
pkgver=v1.0.13.r0.g91211e0
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages"
arch=(x86_64)
url="http://scantailor.org/"
license=("GPL")
depends=('qt5-base' 'libtiff' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools' 'eigen' 'boost')
source=('scantailor-advanced::git+https://github.com/4lex4/scantailor-advanced')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
  cmake \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	.
  make -j2
}

package() {
  cd "$srcdir"/${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
