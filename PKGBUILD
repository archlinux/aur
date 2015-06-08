# Maintainer: Carl George < arch at cgtx dot us >

_name="python-keystoneclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.6.0"
pkgrel="1"
pkgdesc="Client Library for OpenStack Identity"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=0.11" "python2-pbr>=0.11")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('45ac3b13b8b63ab62cb3fbfcaf46a2241d8053dfe17961db911c45c1f23d06ff')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-keystoneclient() {
    depends=("python-babel>=1.3"
             "python-iso8601>=0.1.9"
             "python-netaddr>=0.7.12"
             "python-oslo-config>=1.11.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-serialization>=1.4.0"
             "python-oslo-utils>=1.4.0"
             "python-pbr>=0.11"
             "python-prettytable>=0.7"
             "python-requests>=2.5.2"
             "python-six>=1.9.0"
             "python-stevedore>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-keystoneclient() {
    depends=("python2-babel>=1.3"
             "python2-iso8601>=0.1.9"
             "python2-netaddr>=0.7.12"
             "python2-oslo-config>=1.11.0"
             "python2-oslo-i18n>=1.5.0"
             "python2-oslo-serialization>=1.4.0"
             "python2-oslo-utils>=1.4.0"
             "python2-pbr>=0.11"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-six>=1.9.0"
             "python2-stevedore>=1.3.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
