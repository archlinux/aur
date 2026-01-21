# Maintainer: gilcu3
# Contributor: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-api'
pkgver="0.9.1"
pkgrel=1
pkgdesc="Pyhton bindings for Zulip API."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/zulip/python-zulip-api"
license=('GPL')
depends=(
    'python'
    'python-requests'
    'python-distro'
    'python-click'
    'python-typing_extensions'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('81ba386f9f621f2783d7c65fe13e5de2aa6c9ebfe1e54a366f913107388820e7')

check(){
    cd ${pkgname}-${pkgver}/zulip/
    pytest tests/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py build_ext --inplace
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/zulip"
    python setup.py install --root="${pkgdir}" --optimize=1
}
