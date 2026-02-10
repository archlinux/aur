# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Lam Duong <lamduongt94@gmail.com>

pkgname=python-fastcore
_pkgname=fastcore
pkgver=1.12.11
pkgrel=1
pkgdesc='Python supercharged for the fastai library'
arch=('any')
url='https://github.com/fastai/fastcore'
license=('Apache')
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
sha512sums=('61a4377df8e296ea43f663e9e3fb5bdb46d3ab11cc08587ae6dcee6b52f4b62a03ae2b16f756cc24749d816dd1057a9fe91c7091cb8c0cfb7319eb8e95b2de0d')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
