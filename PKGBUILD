# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-api'
pkgver='0.6.4'
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
sha256sums=('c8cfe838af6da1516be7ddf73bcbb09402df47aa506173b8706a995114326508')

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
