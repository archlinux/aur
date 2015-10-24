# Maintainer: Carl George < arch at cgtx dot us >

_name="keystoneauth1"
_module="${_name%1}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.2.0"
pkgrel="1"
pkgdesc="Authentication Library for OpenStack Identity"
arch=("any")
url="https://github.com/openstack/${_module}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e8386dc8b0f17d439e1f2f4e6a8ef64fe0f2b81938b2f0b13f80042bb98e2b85')

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
    provides=("python-${_name}=${pkgver}-${pkgrel}")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-keystoneauth() {
    depends=("python2-iso8601>=0.1.9"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.5.0")
    provides=("python2-${_name}=${pkgver}-${pkgrel}")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
