# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-pycadf
pkgver=3.1.1
pkgrel=2
pkgdesc="CADF Python module"
arch=(any)
url="https://opendev.org/openstack/pycadf"
license=(Apache-2.0)
depends=('python'
         'python-six'
         'python-oslo-config'
         'python-oslo-serialization'
         'python-pytz'
         'python-fixtures'
         'python-testtools')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'tar'
             'python-pbr')
checkdepends=('python-hacking'
              'python-flake8-import-order'
              'python-coverage'
              'python-fixtures'
              'python-subunit'
              'python-stestr'
              'python-debtcollector')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('22163ec3876386d1f516f1888eca82b1d103d5c48c9efc5bb1a83af62356ea39dcdfb404ac8724d5cebac2fe3ce1774590b6d7584f24f47d9e1ed04d3b6b3e8b')
backup=("etc/${pkgname#python-}/trove_api_audit_map.conf"
        "etc/${pkgname#python-}/swift_api_audit_map.conf"
        "etc/${pkgname#python-}/panko_api_audit_map.conf"
        "etc/${pkgname#python-}/nova_api_audit_map.conf"
        "etc/${pkgname#python-}/neutron_api_audit_map.conf"
        "etc/${pkgname#python-}/ironic_api_audit_map.conf"
        "etc/${pkgname#python-}/heat_api_audit_map.conf"
        "etc/${pkgname#python-}/gnocchi_api_audit_map.conf"
        "etc/${pkgname#python-}/glance_api_audit_map.conf"
        "etc/${pkgname#python-}/cinder_api_audit_map.conf"
        "etc/${pkgname#python-}/ceilometer_api_audit_map.conf")

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
    rm -rf "$pkgdir/usr/etc"
    install -dDm755 "$pkgdir/etc/${pkgname#python-}"
    install -Dm644 "etc/${pkgname#python-}/trove_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/swift_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/panko_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/nova_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/neutron_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/ironic_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/heat_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/gnocchi_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/glance_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/cinder_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/ceilometer_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 CONTRIBUTING.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
