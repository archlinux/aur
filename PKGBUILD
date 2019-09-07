# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-api'
pkgver='0.6.1'
pkgrel=2
pkgdesc="Pyhton bindings for Zulip API."
url="https://github.com/zulip/python-zulip-api"
depends=('python'
    'python-requests'
    'python-pyopenssl'
    'python-six'
    'python-matrix-client-git')
makedepends=('cython' 'python-setuptools')
license=('GPL')
arch=('x86_64')
source=("https://github.com/zulip/python-zulip-api/archive/${pkgver}.tar.gz")
sha256sums=('b1046974af1d4c685078bfef766e2ee81c709dcf87a01877760650a0076d3e81')

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
