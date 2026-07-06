# Maintainer: Marten Hoffmann <maa@mailbox.org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.14.1
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache-2.0')
depends=(
  python
  python-matplotlib
  python-numpy
  python-pillow
)
makedepends=(
  python-build
  python-installer
  python-setuptools
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/fastai/fastcore/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ee311a0cb2f225993de6c3eca1da7e9fbc2a57c1e7067d39eb3713541635e42bbddca958c30fc0da1c4a5222073a3aa242c1bd04e35dbb6b218c6bca72bf6b4b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

