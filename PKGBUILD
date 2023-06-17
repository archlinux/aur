# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Ben Wolsieffer <benwolsieffer@gmail.com>

pkgname=python-port-for
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Command-line utility and a python library that helps with local TCP ports managment"
arch=(any)
url="https://github.com/kmike/port-for"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4e0f1dc17c3f4da7afb93d5213a4f77625f4a254c0a2f250b15e8999648ff536')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
