# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-oslo-policy
pkgver=4.7.0
pkgrel=1
pkgdesc="Rules engine to enforce access control policy"
arch=(any)
url="https://opendev.org/openstack/oslo.policy"
license=(Apache-2.0)
depends=('python'
         'python-requests'
         'python-oslo-config'
         'python-oslo-context'
         'python-oslo-i18n'
         'python-oslo-serialization'
         'python-yaml'
         'python-stevedore'
         'python-oslo-utils'
         'python-fixtures'
         'python-requests-mock'
         'python-testtools'
         'python-oslotest'
         'python-pbr'
         'python-sphinx'
         'python-docutils')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'git')
checkdepends=('python-stestr'
              'python-coverage')
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
b2sums=('4a25550fbaaa3b085e16e16f92d3cf70bff9c3496edc3394de7715c9585a03c1739c68cb29706d9373f7e21089f4b99e59457e7dd062b24027d246c302421110')

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
