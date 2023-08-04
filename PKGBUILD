# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.4.0
pkgrel=4
pkgdesc="A tool for checking common errors in rpm packages"
arch=(any)
url="https://github.com/rpm-software-management/$pkgname"
license=(GPL2)
depends=(
  binutils
  cpio
  gzip
  python
  python-magic
  python-pybeam
  python-pyxdg
  python-tomli
  python-tomli-w
  python-zstandard
  rpm-tools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
optdepends=(
  'appstream-glib: for AppData file validation'
  'checkbashisms: for checking bashisms'
  'dash: for checking bashisms'
  'desktop-file-utils: for checking desktop entries'
  'python-pyenchant: for spell checking'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('805d0962d9b3980e85d265db3cfb2625818866faa0b8a534552a8d4035cabc6a')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest -c /dev/null
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
