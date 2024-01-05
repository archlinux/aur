# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.5.0
pkgrel=2
pkgdesc="A tool for checking common errors in rpm packages"
arch=(any)
url="https://github.com/rpm-software-management/rpmlint"
license=(GPL2)
depends=(
  binutils
  cpio
  gzip
  python
  python-magic
  python-packaging
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
checkdepends=(python-pytest)
optdepends=(
  'appstream-glib: for AppData file validation'
  'checkbashisms: for checking bashisms'
  'dash: for checking bashisms'
  'desktop-file-utils: for checking desktop entries'
  'python-pyenchant: for spell checking'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a9276782bd9ebca2337ae61a498d4d444e0dce003447409b2339b4cce67b6762')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  script --command 'pytest --override-ini="addopts="'
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
