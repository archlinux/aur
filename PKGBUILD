# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-dgutils-git
_name=dgutils
pkgver=0.1.r0.g91df019
pkgrel=1
pkgdesc="GTK apps development easement"
arch=('any')
url="https://github.com/dzheremi2/dgutils"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'python-gobject'
  'python-yaml'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dzheremi2/dgutils.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
