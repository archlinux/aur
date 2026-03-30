# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Brokenpip3 <brokenpip3[at]gmail[dot]com>
# Contributor: Jens John <dev@2ion.de>

pkgbase=python-pylxd
pkgname=python-pylxd
pkgdesc="A library for interacting with the LXD REST API"
pkgver=2.4.0
pkgrel=1
url="https://github.com/canonical/pylxd"
arch=('any')
license=('Apache-2.0')

depends=(
  'python>=3.10'
  'python-cryptography'
  'python-dateutil'
  'python-requests'
  'python-requests-toolbelt'
  'python-ws4py'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

checkdepends=(
  'python-pytest'
  'python-pytest-cov'
  'python-ddt'
  'python-requests-mock'
)

optdepends=(
  'lxd: to use a local LXD server'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/canonical/pylxd/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f119a6739f7bd0b519aed5430253495092e70a225b31e7f23b876010aa48f63d8d09c8424c903439b87c64a981d6f85bf3a34e631e7e22b3b9c0f88e50b8191a')

build() {
  cd "pylxd-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "pylxd-${pkgver}"
  export PYLXD_WARNINGS="none"
  PYTHONPATH="$PWD" pytest --doctest-modules pylxd
}

package() {
  cd "pylxd-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
