# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eoefunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r34
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://gitlab.com/arjraj/EoEfunc'
license=('GPL')
depends=('python-numpy')
makedepends=('git'
             'python-pip'
             'python-wheel'
             'python-setuptools'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://gitlab.com/arjraj/EoEfunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
#   echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl
}
