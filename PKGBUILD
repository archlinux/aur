# Maintainer: Carl George < arch at cgtx dot us >

_name="keystoneauth1"
_module="${_name%1}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1.0"
pkgrel="1"
pkgdesc="Authentication Library for OpenStack Identity"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('280442dd3db6ff846d2daeb9a66034e0f05c8fd304c92da32854d5727537cc15')

prepare() {
    sed -ri '/argparse/d' "${srcdir}/${_name}-${pkgver}"/requirements.txt
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-keystoneauth() {
    depends=("python-iso8601>=0.1.9"
             "python-requests>=2.5.2"
             "python-six>=1.9.0"
             "python-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-keystoneauth() {
    depends=("python2-iso8601>=0.1.9"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.5.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
