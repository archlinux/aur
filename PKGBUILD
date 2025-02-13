# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=texttest
pkgver=4.4.2
_commit=ca3579ffaacf6d0c04b2b763441fa02d2b77160c
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
sha256sums=('f8231ee6f8e93cff8bdc3720bb831c777a5d870a855d8238a8731fc5951c494d')

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
