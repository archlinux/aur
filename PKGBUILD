# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-messaging
pkgver=14.9.1
pkgrel=1
pkgdesc="OpenStack library for messaging"
arch=(any)
url="https://opendev.org/openstack/oslo.messaging"
license=(Apache-2.0)
depends=('python'
         'python-pbr'
         'python-oslo-config'
         'python-oslo-log'
         'python-oslo-utils'
         'python-oslo-serialization'
         'python-oslo-service'
         'python-stevedore'
         'python-debtcollector'
         'python-cachetools'
         'python-webob'
         'python-amqp'
         'python-kombu'
         'python-oslo-middleware'
         'python-oslo-metrics'
         'python-hacking'
         'python-fixtures'
         'python-testscenarios'
         'python-testtools'
         'python-oslotest'
         'python-pifpaf'
         'python-confluent-kafka'
         'python-pyngus'
         'python-eventlet'
         'python-qpid-proton'
         'python-oslo-concurrency'
         'python-oslo-context'
         'python-yaml'
         'python-requests')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-fixtures'
              'python-stestr'
              'python-pre-commit'
              'python-testscenarios'
              'python-testtools'
              'python-oslotest'
              'python-pifpaf'
              'python-confluent-kafka'
              'python-coverage'
              'python-pyngus'
              'bandit'
              'python-eventlet'
              'python-greenlet'
              'python-futurist'
              'python-pyaml'
              'python-yaml'
              'python-requests')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('7e311df56f5dc48dd3bab2e0df21fad90b47e9fe817b6d40740494ce3a1367b563f81e17efbd58580462311ee356a4ec78547fb03a4591d14939140b9c412339')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    stestr run
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
