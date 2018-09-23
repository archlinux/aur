# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from community/boto3; original contributors:
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# See https://github.com/spulec/moto/issues/1793 for the rationale for this package

pkgname=python-boto3-legacy
pkgver=1.7.84
pkgrel=1
pkgdesc='The AWS SDK for Python (python-moto compatible version)'
arch=('any')
license=('Apache')
url='https://github.com/boto/boto3'
depends=('python-botocore-legacy' 'python-jmespath' 'python-s3transfer')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/boto/boto3/archive/$pkgver.tar.gz")
sha512sums=('556dc7321477bb60a3e67e2727b8c6dd55de02fed94a0d627a4e0461cf5e5ce4de6ff4aceca742fd139f99f3f118a7f5b6b5c0c146a611e6a9310871cb67d2bc')
provides=("python-boto3=$pkgver")
conflicts=(python-boto3)

build() {
  cd boto3-$pkgver
  python setup.py build
}

check() {
  cd boto3-$pkgver/tests
  nosetests -v unit functional
}

package() {
  cd boto3-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
