# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-dgutils-git
_name=dgutils
pkgver=r2.dbdb61a
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
