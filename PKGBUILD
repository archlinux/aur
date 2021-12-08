# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.2.0
pkgrel=1
pkgdesc="A tool for checking common errors in rpm packages"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=(
  'binutils'
  'bzip2'
  'cpio'
  'gzip'
  'python'
  'python-magic'
  'python-pybeam'
  'python-pyxdg'
  'python-toml'
  'python-zstd'
  'rpm-tools'
  'xz'
  'zstd'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-pytest-flake8'
  'python-pytest-xdist'
)
optdepends=(
  'appstream-glib: for AppData file validation'
  'checkbashisms: for checking bashisms'
  'dash: for checking bashisms'
  'desktop-file-utils: for checking desktop entries'
  'python-pyenchant: for spell checking'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha512sums=('5e16747231e3f815b405db194e5d1768d19a2b378db674f57b1ebcba17d0f3320626e4c2b648e79cc180621444439c2c84fd176cd1e0fd7b6585d50492a7f272')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
