# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=4.6.4
pkgrel=3
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
checkdepends=('python-pytest-runner' 'python-redis' 'python-yaml' 'python-msgpack' 'python-pycurl'
              'python-case' 'python-pymongo' 'python-pytz' 'python-pytest-sugar' 'python-sqlalchemy'
              'python-pyro' 'python-boto3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/celery/kombu/archive/$pkgver.tar.gz")
sha512sums=('fe5e4d0b54bbde23983d557b7593b77982aece76277a8c4c69543c18e89d6224ba914da1024b0cb5565915503d60dcd7110d4c6b4e707a3c642c9c26bb7691ad')

prepare() {
  sed -i 's/>=2.5.1/>=2.5/' kombu-$pkgver/requirements/default.txt
}

build() {
  cd kombu-$pkgver
  python setup.py build
}

check() {
  cd kombu-$pkgver
  python setup.py pytest
}

package() {
  cd kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
