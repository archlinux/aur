# Maintainer: German Lashevich <german dot lashevich at gmail dot com>

_pkgname='alacritty-colorscheme'
pkgname="$_pkgname-git"
pkgver=r51.257e466
pkgrel=1
pkgdesc='Change colorscheme of alacritty with ease'
arch=('any')
url="https://github.com/toggle-corp/$_pkgname/"
license=('Apache')
depends=('python-ruamel-yaml' 'python-typed-argument-parser' 'python-pynvim')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/toggle-corp/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgname}"
  python -m build --wheel
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
