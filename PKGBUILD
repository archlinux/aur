# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: hafeoz <hafeoz@kolabnow.com>

pkgname=python-tgcrypto
_pkgname=tgcrypto
pkgver=1.2.5
pkgrel=3
pkgdesc="Fast and Portable Cryptography Extension Library for Pyrogram"
arch=('x86_64' 'aarch64')
url="https://github.com/pyrogram/$_pkgname"
license=("LGPL-3.0-or-later")
depends=("python" "glibc")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
checkdepends=("python-pytest")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("923c93bb93dc05f039278b132870f66ab19fdf8f07facce55d4e9f9af1e5c40c")

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

