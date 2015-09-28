# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="python-novaclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.30.0"
pkgrel="1"
pkgdesc="Client library for OpenStack Compute API"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6608f38083966b3bf684574a1a643ae96b9cec8e09761afc330687f94fb4f9f9')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-novaclient() {
    depends=("python-babel>=1.3"
             "python-iso8601>=0.1.9"
             "python-keystoneclient>=1.6.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-serialization>=1.4.0"
             "python-oslo-utils>=2.0.0"
             "python-pbr>=1.6"
             "python-prettytable>=0.7"
             "python-requests>=2.5.2"
             "python-simplejson>=2.2.0"
             "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-novaclient() {
    depends=("python2-babel>=1.3"
             "python2-iso8601>=0.1.9"
             "python2-keystoneclient>=1.6.0"
             "python2-oslo-i18n>=1.5.0"
             "python2-oslo-serialization>=1.4.0"
             "python2-oslo-utils>=2.0.0"
             "python2-pbr>=1.6"
             "python2-prettytable>=0.7"
             "python2-requests>=2.5.2"
             "python2-simplejson>=2.2.0"
             "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
