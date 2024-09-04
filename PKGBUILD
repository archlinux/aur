# Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Marcin Mikołajczak <me@m4sk.in>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lximage-qt
pkgname=$_pkgname-git
pkgver=2.0.0.r1.g9f95648
pkgrel=1
pkgdesc="The LXQt image viewer"
arch=("i686" "x86_64")
url="https://github.com/lxqt/$_pkgname"
license=("GPL-2.0-only")
depends=('libfm-qt-git' 'qt6-svg' 'hicolor-icon-theme')
optdepends=(
  'qt6-imageformats: support for additional image formats (WEBP, TIFF, etc.)'
  'kimageformats: support for additional image formats (PCX, XCF, HEIF, etc.)'
)
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed "s/-/.r/;s/-/./"
}

prepare() {
  cd $_pkgname
  mkdir -p build
}

build() {
  cd $_pkgname/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd $_pkgname/build
  make DESTDIR="$pkgdir" install
}
