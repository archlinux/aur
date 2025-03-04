# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=python-pynput
_name=${pkgname#python-}
pkgver=1.8.0
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
sha256sums=('8f654f53e63760b68cfd75b01956923ce86b4aba1fb87e8f07a72f65d56f7097')

prepare() {
  cd "$_name-$pkgver"

  # Don't require SETUP_PACKAGES since we're neither building docs nor uploading to PyPI
  sed -i 's/setup_requires=RUNTIME_PACKAGES + SETUP_PACKAGES/setup_requires=RUNTIME_PACKAGES/g' setup.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
