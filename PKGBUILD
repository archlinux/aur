# Maintainer: piernov <piernov@piernov.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=AlbumentationsX
pkgname=python-albumentationsx
pkgver=2.3.0
pkgrel=1
pkgdesc='Fast image augmentation library and easy to use wrapper around other libraries'
arch=('any')
url='https://github.com/albumentations-team/albumentationsx'
license=('AGPL-3.0')
conflicts=('python-albumentations')
provides=("python-albumentations=$pkgver")
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
  python-hatchling
)
optdepends=(
  "python-pytorch: for transforms from pytorch"
  "python-torchvision: for transforms from torchvision"
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/albumentations-team/albumentationsx/archive/${pkgver}.tar.gz")
sha512sums=('a742839f7f97bc919da9f53f8b213809daa34949ef728d64373a1c44f80299c003501d942b53ada7430ecf22c08e7761da197ff5ab983de42aa4fd8c29bd1cf7')

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
