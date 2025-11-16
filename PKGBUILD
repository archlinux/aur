# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-privsep
pkgver=3.8.0
pkgrel=1
pkgdesc="OpenStack library for privilege separation"
arch=(any)
url="https://opendev.org/openstack/oslo.privsep"
license=(Apache-2.0)
depends=('python'
         'python-oslo-log'
         'python-oslo-i18n'
         'python-oslo-config'
         'python-oslo-utils'
         'python-cffi'
         'python-eventlet'
         'python-msgpack'
         'python-fixtures'
         'python-testtools'
         'python-oslotest'
         'python-pbr'
         'python-debtcollector')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'git')
checkdepends=('python-hacking'
              'python-stestr'
              'bandit'
              'pre-commit')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('b195921c8d81096d8aaf4032d0f0b9b021f9adde521be4019944308335e8906e054da87b95caf5ad54f1ff4f0359146425d722295ed25622341cf52557b4ba7c')

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
