# Maintainer: Butui Hu <hot123tea123@gmail.com>
# Contributor: pingplug < aur at pingplug dot me >

_pkgname=openslide-python
pkgname=python-openslide
pkgver=1.3.0
pkgrel=1
pkgdesc='Python bindings to OpenSlide'
arch=('x86_64')
url='https://github.com/openslide/openslide-python'
license=('LGPL')
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
depends=(
  openslide
  python-pillow
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/openslide/openslide-python/archive/v${pkgver}.tar.gz"
)
sha256sums=('6c961c22d96833f7215af2915b1034341ff860583df0e3880cc3137ee1dec7cb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest -v
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
