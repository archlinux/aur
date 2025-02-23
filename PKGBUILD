# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-pygnuutils
_pkgname="${pkgname#python-}"
pkgver=0.1.1
pkgrel=2
pkgdesc='Pure python implementation for GNU utils'
arch=('any')
url='https://github.com/matan1008/pygnuutils'
license=('GPL-3.0-or-later')
depends=('python' 'python-click')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7607e8d51b3315f2ff48df131670ca33507ea5509c1f18d62e338ec2959dc839')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
