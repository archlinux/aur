# Maintainer: piernov <piernov@piernov.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=AlbumentationsX
pkgname=python-albumentationsx
pkgver=2.0.13
pkgrel=1
pkgdesc='Fast image augmentation library and easy to use wrapper around other libraries'
arch=('any')
url='https://github.com/albumentations-team/albumentationsx'
license=('AGPL-3.0')
conflicts=('python-albumentations')
provides=('python-albumentations')
depends=(
  python-albucore
  python-numpy
  python-opencv
  python-pydantic
  python-scipy
  python-typing_extensions
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  "python-pytorch: for transforms from pytorch"
  "python-torchvision: for transforms from torchvision"
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/albumentations-team/albumentationsx/archive/${pkgver}.tar.gz")
sha512sums=('cbe0c59c7046ab683f7d98f435d1579093dd0835f353a8f4c1f8874113cfee8c776e0f879f0ba01d554c1e81b984028a3cccf5290f42a7f61303e7389b1b479f')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
