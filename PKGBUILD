# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: David Roheim <david.roheim@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=rpmlint
pkgver=2.3.0
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
  'python-zstandard'
  'rpm-tools'
  'xz'
  'zstd'
)
makedepends=('python-setuptools')
checkdepends=(
  'python-pytest'
)
optdepends=(
  'appstream-glib: for AppData file validation'
  'checkbashisms: for checking bashisms'
  'dash: for checking bashisms'
  'desktop-file-utils: for checking desktop entries'
  'python-pyenchant: for spell checking'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ff6271f2e77a76f19caa5ceff9d90e32ef9da3a6140f0726e0e697c0381f496b')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"

  python -m pytest -c /dev/null
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
