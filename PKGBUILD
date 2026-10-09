# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-pylnk3
pkgver=0.4.3
pkgrel=3
pkgdesc="Python library for reading and writing Windows shortcut files (.lnk)"
url="https://github.com/strayge/pylnk"
arch=('any')
license=('LGPL-3.0-or-later')
depends=(
  'python>=3.9'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'git'
)
checkdepends=(
  'python-pytest'
)
source=("git+$url#tag=$pkgver")
b2sums=('b238c0ca932d9c397d9ce8338c91f6c17302b1af70d9f208b0563287525b649f4214a2e5dab851f57416b96f72bf63cd8797db390651adf4b6b1edc3a74ed36c')

prepare() {
  git -C pylnk clean -dfx
}

build() {
  cd pylnk
  python -m build -wnx
}

check() {
  cd pylnk
  pytest
}

package() {
  cd pylnk
  python -m installer -d "$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
