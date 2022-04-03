# Contributor: Jerry Lin <jerry73204 at gmail dot com>
pkgname=python-av-git
pkgver=r1324.15be68f
pkgrel=1
pkgdesc='Pythonic bindings for FFmpeg'
arch=(any)
url="https://github.com/mikeboers/PyAV"
license=('custom:BSD-3-clause')
provides=(python-av)
conflicts=(python-av)
depends=(ffmpeg python)
makedepends=(git python-setuptools cython)
source=("python-av::git+${url}.git#branch=main")
sha512sums=('SKIP')

pkgver() {
  cd python-av
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd python-av
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd python-av
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
