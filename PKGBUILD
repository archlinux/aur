pkgname=python-qtermwidget
pkgver=0.15.0
pkgrel=1
pkgdesc="Python bindings for QTermWidget"
arch=("x86_64")
url="https://lxqt.org"
# Yep, it"s messy when you"re talking about licenses
license=("LGPL" "custom:BSD" "custom:Public Domain")
depends=("python" "qtermwidget")
conflicts=("python-qtermwidget-git")
makedepends=("lxqt-build-tools" "git")
source=("https://github.com/lxqt/qtermwidget/releases/download/$pkgver/qtermwidget-$pkgver.tar.xz")
sha256sums=('6ecaf7c91be282c5e34937a853fe649729966c38d7e8f4cf54c0df94d85ac3ee')

build() {
  mkdir -p build
  cd build

  cmake "$srcdir/qtermwidget-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQTERMWIDGET_BUILD_PYTHON_BINDING=ON
  make
}

package() {
  cd build/pyqt
  make DESTDIR="$pkgdir" install
}
