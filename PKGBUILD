# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-kombu
pkgname=('python-kombu' 'python2-kombu')
pkgver=4.6.1
pkgrel=1
pkgdesc='A messaging library for Python'
arch=('any')
url="https://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
makedepends=('python-amqp' 'python2-amqp' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-redis' 'python2-redis'
              'python-yaml' 'python2-yaml' 'python-msgpack' 'python2-msgpack'
              'python-pycurl' 'python2-pycurl' 'python-case' 'python2-case' 'python-pymongo'
              'python2-pymongo' 'python-pytz' 'python2-pytz' 'python-pytest-sugar'
              'python2-pytest-sugar' 'python-sqlalchemy' 'python2-sqlalchemy' 'python-pyro'
              'python2-pyro' 'python2-librabbitmq' 'python-boto3' 'python2-boto3')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/kombu/archive/$pkgver.tar.gz")
sha512sums=('af291ad1a342192032e05882b0d980d91d12b5e9549d0e15c125bafe784c79062c1cc4374b2f4d6ea2b8cf062c8a2cc1ba4b43030d305611c8cf456f2698c100')

prepare() {
  cp -a kombu-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/kombu-$pkgver
  python setup.py build

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/kombu-$pkgver
  python setup.py pytest

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py pytest
}

package_python-kombu() {
  depends=('python-amqp')
  optdepends=('python-pymongo: for MongoDB support'
              'python-msgpack: for MessagePack support'
              'python-pyro: for Pyro support'
              'python-redis: for Redis support'
              'python-sqlalchemy: for SQLAlchemy support'
              'python-boto3: for Amazon SQS support'
              'python-pycurl: for Amazon SQS support'
              'python-yaml: for YAML support')
              # 'python-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python-kazoo: for Zookeeper support': Not packaged yet
              # 'python-librabbitmq: C optimization for AMQP transport' Not available for python 3 yet

  cd "$srcdir"/kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-kombu() {
  depends=('python2-amqp')
  optdepends=('python2-pymongo: for MongoDB support'
              'python2-msgpack: for MessagePack support'
              'python2-pyro: for Pyro support'
              'python2-redis: for Redis support'
              'python2-sqlalchemy: for SQLAlchemy support'
              'python2-pycurl: for Amazon SQS support'
              'python2-yaml: for YAML support'
              'python2-librabbitmq: C optimization for AMQP transport'
              'python2-boto3: for Amazon SQS support')
              # 'python2-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python2-kazoo: for Zookeeper support': Not packaged yet

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
