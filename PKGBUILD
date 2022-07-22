# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=python-oss2
_pkgname=aliyun-oss-python-sdk
pkgver=2.16.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aliyun/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('93e41cc9f49c74de025227ccf20dad91d420a39b88629bc2c7062923e2ac86b7')

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
