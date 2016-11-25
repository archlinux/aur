# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-kombu
pkgname=('python-kombu' 'python2-kombu')
pkgver=4.0.0
pkgrel=1
pkgdesc='A messaging library for Python'
arch=('any')
url="http://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
makedepends=('python-amqp' 'python2-amqp' 'python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-redis' 'python2-redis' 'python-yaml' 'python2-yaml' 'python-msgpack' 'python2-msgpack'
              'python2-boto' 'python-pycurl' 'python2-pycurl' 'python-pytest-runner' 'python2-pytest-runner'
              'python-case' 'python2-case' 'python2-pymongo' 'python-pytz' 'python2-pytz'
              'python-couchdb' 'python2-couchdb' 'python-sqlalchemy' 'python2-sqlalchemy'
              'python-pyro' 'python2-pyro')
              # 'python-boto' 'python-pymongo' 'python2-librabbitmq'
              # https://github.com/celery/kombu/issues/661
              # https://github.com/celery/kombu/issues/662
              # https://github.com/celery/kombu/issues/663
source=("git+https://github.com/celery/kombu.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cp -a kombu{,-py2}
}

check() {
  cd "$srcdir"/kombu
  python setup.py ptr

  cd "$srcdir"/kombu-py2
  python2 setup.py ptr
}

package_python-kombu() {
  depends=('python-amqp')
  optdepends=('python-pymongo: for MongoDB support'
              'python-msgpack: for MessagePack support'
              'python-pyro: for Pyro support'
              'python-redis: for Redis support'
              'python-sqlalchemy: for SQLAlchemy support'
              'python-boto: for Amazon SQS support'
              'python-pycurl: for Amazon SQS support'
              'python-yaml: for YAML support'
              'python-pyzmq: for ZeroMQ support'
              'python-couchdb: for CouchDB support')
              # 'python-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python-kazoo: for Zookeeper support': Not packaged yet
              # 'python-librabbitmq: C optimization for AMQP transport' Not available for python 3 yet
              # 'python-beanstalkc: for Beanstalk Support' Not available for python 3 yet

  cd "$srcdir"/kombu
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-kombu() {
  depends=('python2-amqp')
  optdepends=('python2-pymongo: for MongoDB support'
              'python2-msgpack: for MessagePack support'
              'python2-pyro: for Pyro support'
              'python2-redis: for Redis support'
              'python2-sqlalchemy: for SQLAlchemy support'
              'python2-boto: for Amazon SQS support'
              'python2-pycurl: for Amazon SQS support'
              'python2-yaml: for YAML support'
              'python2-pyzmq: for ZeroMQ support'
              'python2-librabbitmq: C optimization for AMQP transport'
              'python2-couchdb: for CouchDB support')
              # 'python2-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python2-kazoo: for Zookeeper support': Not packaged yet
              # 'python2-beanstalkc: for Beanstalk Support' Not packaged yet

  cd "$srcdir"/kombu-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
