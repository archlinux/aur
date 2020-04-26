# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-api'
pkgver='0.7.0'
pkgrel=1
pkgdesc="Pyhton bindings for Zulip API."
url="https://github.com/zulip/python-zulip-api"
depends=('python'
    'python-requests'
    'python-pyopenssl'
    'python-six'
    'python-matrix-client-git')
makedepends=('cython' 'python-setuptools')
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
source=("https://github.com/zulip/python-zulip-api/archive/${pkgver}.tar.gz")
sha256sums=('8f843862536645f52b1171fd3e06ab34295ae3de194cb748ef526127f7bed9c0')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    # Remove typing dependency check
    # - typing module is included in system python
    # - zulip-api does not see version of this module => crash
    sed -i "/typing>=/d" setup.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py install --root="${pkgdir}"
}
