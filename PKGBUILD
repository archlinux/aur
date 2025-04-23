# Maintainer: userbyte <contact@userbyte.xyz>
pkgname='python-pyamlboot-git'
_pkgname="${pkgname/-git/}"
pkgver=r91.d7806ac
pkgrel=2
pkgdesc="Amlogic USB Boot Protocol Library "
url="https://github.com/superna9999/pyamlboot"
depends=('python')
license=('MIT')
arch=('any')
source=("git+$url.git")
_srcname="${_pkgname/python-/}"

makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=42'
  'python-wheel'
)
depends=(
  'python>=3.7'
  'python-dateparser'
  'python-dateutil'
  'python-lxml'
  'python-pyusb'
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcname"

  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "$_srcname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

# eof

