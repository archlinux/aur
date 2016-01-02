# Maintainer: Carl George < arch at cgtx dot us >

_name="os-client-config"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.13.1"
pkgrel="1"
pkgdesc="OpenStack Client Configuation Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ae74499108187ea9136467576d3cbe4f2e42ba05f93528102644195dd91e4c54')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-os-client-config() {
    depends=(
        "python-yaml>=3.1.0"
        "python-appdirs>=1.3.0"
        "python-keystoneauth1>=2.1.0"
        "python-requestsexceptions>=1.1.1"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-os-client-config() {
    depends=(
        "python2-yaml>=3.1.0"
        "python2-appdirs>=1.3.0"
        "python2-keystoneauth1>=1.0.0"
        "python2-requestsexceptions>=1.1.1"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
