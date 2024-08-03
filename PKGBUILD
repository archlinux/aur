# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-versionedobjects
pkgver=3.4.0
pkgrel=1
pkgdesc="OpenStack versioned objects library"
arch=(any)
url="https://opendev.org/openstack/oslo.versionedobjects"
license=(Apache-2.0)
depends=('python'
         'python-oslo-concurrency'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-messaging'
         'python-oslo-serialization'
         'python-oslo-utils'
         'python-iso8601'
         'python-oslo-log'
         'python-oslo-i18n'
         'python-webob'
         'python-netaddr'
         'python-jsonschema'
         'python-fixtures'
         'python-testtools'
         'python-eventlet')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-oslotest'
              'python-coverage'
              'python-stestr'
              'bandit'
              'python-pre-commit')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ea90efeb6fe79b0950abf7da67d275a9f4b72664633c15c51fc6199d7a14cdb0748148f44ebd05191e179a900ecbbf3362dcf8a1d7da945bb4c5fd79d8de33f5')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

#check(){
#    cd "$pkgname-$pkgver"
#    stestr run
#}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
