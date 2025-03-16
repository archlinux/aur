# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-messaging
pkgver=16.1.0
pkgrel=1
pkgdesc="OpenStack library for messaging"
arch=(any)
url="https://opendev.org/openstack/oslo.messaging"
license=(Apache-2.0)
depends=(
    'python'
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
#    'python-pyngus'
    'python-eventlet'
#    'python-qpid-proton'
    'python-oslo-concurrency'
    'python-oslo-context'
    'python-yaml'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-hacking'
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
    'python-requests'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('2bc03d5c3bcae49d44db8a5db624d57a142fd1fee8bb9edd003c021e8067a7ae08af166d422a0a0dcfff50a718727c3d8ed7a303b2f8b4d4934873c54e139b39')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check(){
#    cd "$pkgname-$pkgver" || exit
#    stestr run
#}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
