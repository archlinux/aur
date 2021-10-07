# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=2.1.0
pkgrel=1
pkgdesc="Code style enforcement for bash programs"
arch=('any')
makedepends=('python-setuptools')
depends=('python'
         'python-pbr')
url="https://github.com/openstack/${pkgname}"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a3ece9c844f2f9772ee9311ef692a8b0851135a5d9ca2a99b3fe9815d236ca6b')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    PBR_VERSION=$pkgver \
    python setup.py install \
        --skip-build \
        --optimize=1 \
        --prefix=/usr \
        --root=${pkgdir}
}
