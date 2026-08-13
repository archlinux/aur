# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Francois Boulogne <fboulogne at april dot org>
pkgname=python-liblarch-git
_name=liblarch
pkgver=3.2.0.r3.gfe06860
pkgrel=3
pkgdesc="Python library to easily handle data structure, with a GTK binding"
arch=('any')
url="https://github.com/getting-things-gnome/liblarch"
license=('LGPL-3.0-or-later')
depends=(
  'gtk3'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# checkdepends=('python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/getting-things-gnome/liblarch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  git clean -dfx
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_name"
#   python -m venv --clear --without-pip --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -I -m pytest
# }

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
