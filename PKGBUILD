# Maintainer: Carl George < arch at cgtx dot us >

_name="python-openstackclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.9.0"
pkgrel="1"
pkgdesc="OpenStack Command-line Client"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b9d983580cca2203509e85c46e6437a89caaf324d9755891ea860954b3eedf84')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-openstackclient() {
    depends=(
        "python-pbr>=1.6"
        "python-six>=1.9.0"
        "python-babel>=1.3"
        "python-cliff>=1.14.0"
        "python-keystoneauth1>=1.0.0"
        "python-os-client-config>=1.4.0"
        "python-oslo-config>=2.6.0"
        "python-oslo-i18n>=1.5.0"
        "python-oslo-utils>=2.4.0"
        "python-glanceclient>=0.18.0"
        "python-keystoneclient>=1.6.0"
        "python-novaclient>=2.29.0"
        "python-cinderclient>=1.3.1"
        "python-neutronclient>=2.6.0"
        "python-requests>=2.5.2"
        "python-stevedore>=1.5.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-openstackclient() {
    depends=(
        "python2-pbr>=1.6"
        "python2-six>=1.9.0"
        "python2-babel>=1.3"
        "python2-cliff>=1.14.0"
        "python2-keystoneauth1>=1.0.0"
        "python2-os-client-config>=1.4.0"
        "python2-oslo-config>=2.6.0"
        "python2-oslo-i18n>=1.5.0"
        "python2-oslo-utils>=2.4.0"
        "python2-glanceclient>=0.18.0"
        "python2-keystoneclient>=1.6.0"
        "python2-novaclient>=2.29.0"
        "python2-cinderclient>=1.3.1"
        "python2-neutronclient>=2.6.0"
        "python2-requests>=2.5.2"
        "python2-stevedore>=1.5.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
}
