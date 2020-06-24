# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=4.6.11
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
sha512sums=('67656c63e42c1cf018c438d60edece925cdf1a25abb46c9b413bfca3032ba108550277ced70f6696d61561d501fe49f85f0f8ee063405ac650662aa24d0cc95a')

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
