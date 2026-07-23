# Maintainer: piernov <piernov@piernov.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=AlbumentationsX
pkgname=python-albumentationsx
pkgver=2.3.5
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
sha512sums=('c262971cc58ea289f2e38ea904934c8567f7b7107a7bbcceafdfaea4ebd0351281be6d07d73285db7959b6dbf38a351bb102892955253cfedb8f5b1e444766ca')

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
