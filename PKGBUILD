pkgname=python-qtermwidget
pkgver=0.16.1
pkgrel=1
pkgdesc="Python bindings for QTermWidget"
arch=("x86_64")
url="https://lxqt.org"
# Yep, it"s messy when you"re talking about licenses
license=("LGPL" "custom:BSD" "custom:Public Domain")
depends=("python" "qtermwidget" "python-sip" "sip")
conflicts=("python-qtermwidget-git")
makedepends=("lxqt-build-tools" "git")
source=("https://github.com/lxqt/qtermwidget/releases/download/$pkgver/qtermwidget-$pkgver.tar.xz")
sha256sums=('9266fe2b9d8b8c7297960660c13f816093706f18453c883671445ed49123b938')

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
