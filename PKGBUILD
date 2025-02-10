# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-etcd3gw
pkgver=2.4.2
pkgrel=1
pkgdesc="An etcd3 grpc-gateway v3 API Python client"
arch=(any)
url="https://opendev.org/openstack/etcd3gw"
license=('Apache-2.0')
depends=(
    'python'
    'python-pbr'
    'python-requests'
    'python-futurist'
    'python-testtools'
    'python-oslotest'
    'python-urllib3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-hacking'
    'python-coverage'
    'python-subunit'
    'python-testrepository'
    'python-testscenarios'
    'python-pifpaf'
    'python-nose'
    'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('f608190a952b0485f96a0508eed2ae735365453aadabaae190822bb2dc4b2992d42fe99c9707d5d42d6859eb105376c5f11f04fe69741a4e267d46733972cbb9')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    python -m unittest -v
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
