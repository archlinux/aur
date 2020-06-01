# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=4.6.9
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/kombu/archive/$pkgver.tar.gz")
sha512sums=('7f80ab3b9210d372da297735610cf423e49afaaaac320f63bd62dbc53cf5aebfdca71142fe758557bc96adc43cf05f7dc191fad5fbe6b7cb9493df37cad1bbb8')

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
