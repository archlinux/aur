# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.4.0
_commit=0f024202b56ca913e1149e857f296e6c04a83441
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('27bbfa733bc0d7d7a763f3c555ffda91e5d2202a402a1f42611e1d2523074ad5')

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
