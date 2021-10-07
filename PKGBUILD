# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bashate
pkgver=2.0.0
pkgrel=1
pkgdesc="Code style enforcement for bash programs"
arch=('any')
makedepends=('python-setuptools')
depends=('python'
         'python-pbr')
url="https://github.com/openstack/${pkgname}"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('025d75cf779e9f0634a508644bc9e5a4d0ea82fbecf1b88d8585ee2721243964')

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
