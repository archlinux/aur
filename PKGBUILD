# Maintainer: Henri <sandwichd@proton.me>

pkgname=ampere-git
_pkgname=ampere
pkgver=0.1.11.r17.g4f5b20b
pkgrel=1
pkgdesc="Ampere – a simple desktop audio player"
arch=('any')
url="https://example.com/ampere"
license=('MIT')
depends=(
  'python'
  'pyside6'
  'python-mutagen'
  'python-vlc'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=('ampere')
conflicts=('ampere')
source=("${_pkgname}::git+file://${PWD}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if git describe --tags --long &>/dev/null; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "0.1.10.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
.
}
