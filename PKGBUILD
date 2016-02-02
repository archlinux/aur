# Maintainer: Carl George < arch at cgtx dot us >

_name="requestsexceptions"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1.2"
pkgrel="1"
pkgdesc="Import exceptions from potentially bundled packages in requests"
arch=("any")
url="https://github.com/openstack-infra/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d482d55aa5ea1dd4f966d58e368c2d2c4514c9d8d4715eefaca198626344d92f')

prepare() {
    sed -ri '/pbr/d' "${srcdir}/${_name}-${pkgver}/requirements.txt"
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-requestsexceptions() {
    depends=("python-requests")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-requestsexceptions() {
    depends=("python2-requests")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
