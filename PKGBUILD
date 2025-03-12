# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=texttest
pkgver=4.4.3
_commit=d3f20fdd3295b4241d8d689d2f2b85d02f99c556
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
sha256sums=('18e91b4109372180ca829fee1cd5863d7e83c8762f916f9e1295a0586757b3d4')

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
