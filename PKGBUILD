# Maintainer:
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

_pkgname="python-podman"
pkgname="$_pkgname-git"
pkgver=5.3.0.r16.gd3dd154
pkgrel=1
pkgdesc="Python bindings for Podman's RESTful API"
url="https://github.com/containers/podman-py"
license=('Apache-2.0')
arch=('any')

depends=(
  'python'
  'python-requests'
  'python-rich'
  'python-urllib3'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="podman-py"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

conflicts=('python-podman')
provides=('python-podman' 'python-podman-py')

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
