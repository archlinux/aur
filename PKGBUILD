# Maintainer: Carl George < arch at cgtx dot us >

_name="requestsexceptions"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1.1"
pkgrel="1"
pkgdesc="Import exceptions from potentially bundled packages in requests"
arch=("any")
url="https://github.com/openstack-infra/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('21853958a2245d6dc1c851cf31ccc24ab5142efa67d73cca4b7678f604bbaf52')

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
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-requestsexceptions() {
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
