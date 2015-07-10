# Maintainer: Carl George < arch at cgtx dot us >

_name="python-swiftclient"
_module="${_name#python-}"
_cmd="${_module%client}"

#pkgname=("python-${_module}" "python2-${_module}")
pkgname="python-${_module}"
pkgver="2.4.0"
pkgrel="1"
pkgdesc="OpenStack Object Storage API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
#makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
makedepends=("python-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e865553b3afc63a9952cfa30f155a604564cae31a40275fa2ce94c80d7affd4b')

prepare() {
    #cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
    # futures is only needed for python 2
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/futures/d' requirements.txt
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    #cd "${srcdir}/${_name}-${pkgver}-python2"
    #python2 setup.py build
}

package_python-swiftclient() {
    depends=("python-requests>=1.1"
             "python-simplejson>=2.0.9"
             "python-six>=1.5.2")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

#package_python2-swiftclient() {
#    depends=("python2-futures>=2.1.3"
#             "python-requests>=1.1"
#             "python-simplejson>=2.0.9"
#             "python-six>=1.5.2")
#    cd "${srcdir}/${_name}-${pkgver}-python2"
#    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
#    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
#    mv "${pkgdir}/usr/share/man/man1/${_cmd}.1" "${pkgdir}/usr/share/man/man1/${_cmd}2.1"
#}
