# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-messaging
pkgver=17.1.0
pkgrel=1
pkgdesc="OpenStack library for messaging"
arch=(any)
url="https://opendev.org/openstack/oslo.messaging"
license=(Apache-2.0)
depends=(
    'python'
    'python-pbr'
    'python-futurist'
    'python-oslo-config'
    'python-oslo-context'
    'python-oslo-log'
    'python-oslo-utils'
    'python-oslo-serialization'
    'python-oslo-service'
    'python-stevedore'
    'python-debtcollector'
    'python-cachetools'
    'python-webob'
    'python-yaml'
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
    'python-eventlet'
    'python-oslo-concurrency'
    'python-oslo-context'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'git'
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
    'bandit'
    'python-eventlet'
    'python-greenlet'
    'python-futurist'
    'python-pyaml'
    'python-yaml'
    'python-requests'
)
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('189ef9bc88c82f6cfbfbfd70fd70f4d6d42dda7bd65725e60ccc377870d98f2822b241e18cf7438b62071df3a30aec1f950f7c1f2a71a457f9e1f3cea4821092')

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
