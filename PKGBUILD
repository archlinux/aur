# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eoefunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r51.c40c91b
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/End-of-Eternity/EoEfunc'
license=('GPL')
depends=('python-numpy')
makedepends=('git'
             'python-pip'
             'python-wheel'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/End-of-Eternity/EoEfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl
}
