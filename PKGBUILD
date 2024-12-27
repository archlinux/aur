# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Thomas Weißschuh <thomas t-8ch de>

pkgname=python-expiringdict
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=2
pkgdesc='Dictionary with auto-expiring values for caching purposes'
arch=(any)
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools)
checkdepends=(
  python-nose
  python-mock
  python-coverage
  python-dill
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('7c56642d1bb403520b6fe47b0ba3f05de464deab64e4783cc281c87fb9751e80a371d5b54485e51ff056eca5aa83b62f13b47d3e30fd6d8b23dd60b67759ac45')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  nosetests --with-coverage --cover-package=expiringdict
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
