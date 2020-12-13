# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-oss2
_pkgname=aliyun-oss-python-sdk
pkgver=2.13.0
pkgrel=1
pkgdesc="Aliyun OSS SDK for Python."
arch=('any')
url="https://github.com/aliyun/aliyun-oss-python-sdk/"
license=('MIT')
depends=('python-requests'
         'python-crcmod'
         'python-pycryptodome'
         'python-aliyun-python-sdk-core'
         'python-aliyun-python-sdk-kms'
         'python-six')
makedepends=('python-setuptools')
conflicts=("${pkgname}-git")
provides=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aliyun/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e6e2e20a40950d486b2b70bf19843e3e0ea33d89e6214ca1be65448b90a7867b')

prepare() {
  cd $_pkgname-$pkgver
  sed -i "s|== 2|== 3|g" setup.py
}
build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim: ts=2 sw=2 et:
