# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pynput
_name=${pkgname#python-}
pkgver=1.8.2
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL-3.0-or-later')
depends=(
  'python-evdev'
  'python-six'
  'python-xlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('acd65b9e979ae7efe2e2f3fad83a7eda736dd2de364efbc113a9af4c8222a6df')

prepare() {
  cd "$_name-$pkgver"

  # Don't require SETUP_PACKAGES
  # only required for building docs and uploading to PyPI
  sed -i \
    's/setup_requires=RUNTIME_PACKAGES + SETUP_PACKAGES/setup_requires=RUNTIME_PACKAGES/g' \
    setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
