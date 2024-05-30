# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-etcd3gw
pkgver=2.4.1
pkgrel=1
pkgdesc="An etcd3 grpc-gateway v3 API Python client"
arch=(any)
url="https://opendev.org/openstack/etcd3gw"
license=('Apache-2.0')
depends=('python'
         'python-pbr'
         'python-requests'
         'python-futurist'
         'python-testtools'
         'python-oslotest'
         'python-urllib3')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar')
checkdepends=('python-hacking'
              'python-coverage'
              'python-subunit'
              'python-testrepository'
              'python-testscenarios'
              'python-pifpaf'
              'python-nose'
              'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('601e83e37910762ec4a434a0ca62743dcaab356796da912b745de9c4ae84da2f509148975562dcf6354709f20818d22b7f015dfc5fae3e8bff7ece6226cb7dc9')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver"
    python -m unittest -v
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 HACKING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
