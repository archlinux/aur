# Maintainer: Bao Trinh <qubidt at gmail dot com>
# Contributor: Lisa White <legeana@liri.ie>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=python-pika
pkgver=1.3.1
pkgrel=1
pkgdesc="A pure-Python implementation of the AMQP 0-9-1 protocol"
arch=('any')
url="http://pika.readthedocs.org/"
license=('GPL')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose2' 'python-nose' 'python-gevent' 'python-twisted' 'python-tornado')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname#python-}/${pkgname#python-}/archive/${pkgver}/${pkgname#python-}-${pkgver}.tar.gz")
sha256sums=('4f3bd9e90f1cfa48b8ef0230417fc7b3bc3a4cd8b27d2bb3a4c05e6d5f71210c')

build() {
  cd "${pkgname#python-}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}-${pkgver}"
  nose2 tests.unit
}

package() {
  cd "${pkgname#python-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
