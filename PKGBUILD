# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=python-gio-pyio
pkgver=0.0.5
pkgrel=1
pkgdesc='Library provides Python like IO for Gio'
arch=(any)
url='https://github.com/cmkohnen/gio_pyio'
license=(GPL-3.0-only)
depends=(
  glib2
  python
  python-gobject
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("git+https://github.com/cmkohnen/gio_pyio.git#tag=$pkgver")
b2sums=(a109956e9b6db433d02f8be579570681c6d8c70ef77047f5d13456dd3cd1745c1108588a725d4721a7ac8a6c18f59631a96e8474c581fbdf0d6dece60c8f8806)

build() {
  cd gio_pyio
  python -m build --wheel --no-isolation
}

check() {
  cd gio_pyio
  PYTHONPATH="$PWD/build/lib" \
    pytest
}

package() {
  cd gio_pyio
  python -m installer --destdir="$pkgdir" dist/*.whl
}
