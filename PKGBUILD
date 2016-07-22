# Maintainer: Mark Vainomaa <mikroskeem@mikroskeem.eu>
pkgname=python-pulsar-git
pkgver=1.4.0.dev20160719065823
pkgrel=1
pkgdesc="Event driven concurrent framework using asyncio"
arch=("any")
url="http://pythonhosted.org/pulsar/"
license=('BSD')
depends=("python")
makedepends=("python-setuptools" "cython")
provides=("python-pulsar")
conflicts=("python-pulsar")
replaces=("python-pulsar")
source=("python-pulsar-git::git+https://github.com/quantmind/pulsar.git")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    cat pulsar.egg-info/PKG-INFO |grep "^Version:" | awk '{print $2}'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -d -m 755 ${pkgdir}/usr/share/licenses/${pkgname}
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ft=sh
