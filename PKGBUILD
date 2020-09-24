# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.0.2
pkgrel=1
pkgdesc='A messaging library for Python'
arch=('any')
url="https://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
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
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-redis' 'python-yaml' 'python-msgpack' 'python-pycurl'
              'python-case' 'python-pymongo' 'python-pytz' 'python-pytest-sugar' 'python-sqlalchemy'
              'python-pyro' 'python-boto3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/kombu/archive/v$pkgver.tar.gz")
sha512sums=('2ff1dfed530773ce500af4a1ad30bf66a1e5e65705f5192193714b59c12bd4c2bb69a2a716c169bd45784b8db2ad35f45226746d972df776d9b54c35b08d6e91')

build() {
  cd kombu-$pkgver
  python setup.py build
}

check() {
  cd kombu-$pkgver
  python -m pytest
}

package() {
  cd kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
