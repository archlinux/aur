# Maintainer: Jonas Strassel <info@jonas-strassel.de>

pkgname=scantailor-git
pkgver=RELEASE_0_9_12_1.r5.g67a8466
pkgrel=1
pkgdesc="Interactive post-processing tool for scanned pages"
arch=(x86_64)
url="http://scantailor.org/"
license=("GPL")
depends=('qt5-base' 'libtiff' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('cmake' 'qt5-tools' 'eigen' 'boost')
source=('scantailor::git+https://github.com/scantailor/scantailor')
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
  make -j
}

package() {
  cd "$srcdir"/${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -Dm0644 "resources/appicon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/scantailor.svg"
  install -Dm0644 "$srcdir"/../"scantailor-git.desktop" "$pkgdir/usr/share/applications/scantailor-git.desktop"
}
