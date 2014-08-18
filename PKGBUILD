# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-kombu
pkgname=('python-kombu' 'python2-kombu')
pkgver=3.0.21
pkgrel=2
pkgdesc='A messaging library for Python'
arch=('any')
url="http://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
makedepends=('python' 'python2')
checkdepends=('python-redis' 'python2-redis' 'python-yaml' 'python2-yaml' 'python-msgpack' 'python2-msgpack'
              'python-boto' 'python2-boto' 'python-pycurl' 'python2-pycurl' 'python-nose' 'python2-nose'
              'python-anyjson' 'python2-anyjson' 'python-amqp' 'python2-amqp' 'python-mock' 'python2-mock')
source=("http://pypi.python.org/packages/source/k/kombu/kombu-${pkgver}.tar.gz"{,.asc})
sha256sums=('2eaca88496bcfcf9b6d597999776853792ef35f919c37e2f0f151dfe38a60d3a'
            'SKIP')

prepare() {
  cp -a kombu-$pkgver{,-py2}
}

check() {
  cd kombu-$pkgver
  nosetests3 || warning "Tests failed"

  cd ../kombu-$pkgver-py2
  nosetests2
}

package_python-kombu() {
  depends=('python-amqp')
  optdepends=('python-pymongo: for MongoDB support'
              'python-msgpack: for MessagePack support'
              'python-pyro: for Pyro support'
              'python-redis: for Redis support'
              'python-sqlalchemy: for SQLAlchemy support'
              'python-boto: for Amazon SQS support'
              'python-yaml: for YAML support'
              'python-pyzmq: for ZeroMQ support')
              # 'python-couchdb: for CouchDB support': Not packaged yet
              # 'python-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python-kazoo: for Zookeeper support': Not packaged yet
              # 'python-librabbitmq: C optimization for AMQP transport' Not available for python 3 yet
              # 'python-beanstalkc: for Beanstalk Support' Not available for python 3 yet

  cd "$srcdir/kombu-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-kombu() {
  depends=('python2-amqp')
  optdepends=('python2-pymongo: for MongoDB support'
              'python2-msgpack: for MessagePack support'
              'python2-pyro: for Pyro support'
              'python2-redis: for Redis support'
              'python2-sqlalchemy: for SQLAlchemy support'
              'python2-boto: for Amazon SQS support'
              'python2-yaml: for YAML support'
              'python2-pyzmq: for ZeroMQ support'
              'python2-librabbitmq: C optimization for AMQP transport')
              # 'python2-couchdb: for CouchDB support': In AUR
              # 'python2-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python2-kazoo: for Zookeeper support': Not packaged yet
              # 'python2-beanstalkc: for Beanstalk Support' Not packaged yet

  cd "$srcdir/kombu-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
