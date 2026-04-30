# Maintainer: piernov <piernov@piernov.org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_pkgname=AlbumentationsX
pkgname=python-albumentationsx
pkgver=2.2.6
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
sha512sums=('060c477d132bcfb99747e2604cfe20ab4911f724c5ffe7a297318391a17d37cc240d11e964a347b28224f76320c1bc69ed0bab10d91adf2f8c9bb606f318495e')

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
