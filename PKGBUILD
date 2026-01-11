# Maintainer: Henri <sandwichd@proton.me>

pkgname=ampere-git
_pkgname=ampere
pkgver=Release.0.gfe658f5
pkgrel=1
pkgdesc="Ampere – a simple desktop audio player"
arch=('any')
url="https://github.com/hent83722/ampere-audio-player"
license=('MIT')
depends=(
  'python'
  'pyside6'
  'python-mutagen'
  'vlc'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=('ampere')
conflicts=('ampere')
source=("${_pkgname}::git+https://github.com/hent83722/ampere-audio-player.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if git describe --tags --long &>/dev/null; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "%s.r%s.g%s" "${pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
