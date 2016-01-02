# Maintainer: Carl George < arch at cgtx dot us >

_name="keystoneauth"
_module="${_name}1"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.1.0"
pkgrel="1"
pkgdesc="Authentication Library for OpenStack Identity"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://tarballs.openstack.org/${_name}/${_module}-${pkgver}.tar.gz")
sha256sums=('3990130416f85a252896fd36f895ab4d0b692b782801d7e4e522b862dbf84e69')

prepare() {
    sed -ri '/argparse/d' "${srcdir}/${_module}-${pkgver}"/requirements.txt
    cp -a "${srcdir}/${_module}-${pkgver}" "${srcdir}/${_module}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-keystoneauth1() {
    depends=(
        "python-iso8601>=0.1.9"
        "python-requests>=2.8.1"
        "python-six>=1.9.0"
        "python-stevedore>=1.5.0"
    )
    conflicts=("python-${_name}")
    replaces=("python-${_name}")
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-keystoneauth1() {
    depends=(
        "python2-iso8601>=0.1.9"
        "python2-requests>=2.8.1"
        "python2-six>=1.9.0"
        "python2-stevedore>=1.5.0"
    )
    conflicts=("python2-${_name}")
    replaces=("python2-${_name}")
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
