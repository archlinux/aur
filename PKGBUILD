# Maintainer:
# Contributor: Gabriele Musco <emaildigabry@gmail.com>

_pkgname="python-openrgb"
pkgname="$_pkgname-git"
pkgver=0.3.3.r0.g0e678de
pkgrel=1
pkgdesc="A python client for the OpenRGB SDK"
url="https://github.com/jath03/openrgb-python"
license=('GPL-3.0-only')
arch=('any')

depends=(
  'openrgb'
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

conflicts=("$_pkgname=${pkgver%%.r*}")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
