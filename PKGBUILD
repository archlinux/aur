# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=texttest
pkgver=4.4.5
_commit=5c69626ecf1491f431eb9874b84e0cd700d7eef9
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=(any)
url="https://github.com/texttest/texttest"
license=(LGPL-2.1-or-later)
depends=(
  gdk-pixbuf2
  glib2
  gtk3
  pango
  python
  python-certifi
  python-gobject
  python-matplotlib
  python-pillow
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=('python-boto: for Amazon EC2 support')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('61492e34a6a67ecd4128b0b3d88fcb070bf73feb2e8c841901f7cda07d65ab96')

pkgver() {
  cd $pkgname-$_commit
  grep -Po 'version = "\K[^"]+' texttestlib/texttest_version.py
}

build() {
  cd $pkgname-$_commit
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$_commit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
