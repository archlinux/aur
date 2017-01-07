# Maintainer: Carl George < arch at cgtx dot us >

_name="python-neutronclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="6.0.0"
pkgrel="2"
pkgdesc="CLI and Client Library for OpenStack Networking"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('a30556f8b9541e94f44a9911d9af89037710761755758a2c1598fa92809293a2')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

package_python-neutronclient() {
    depends=(
        "python-pbr>=1.6"
        "python-cliff>=1.15.0"
        "python-debtcollector>=1.2.0"
        "python-iso8601>=0.1.11"
        "python-netaddr>=0.7.12"
        "python-osc-lib>=1.0.2"
        "python-oslo-i18n>=2.1.0"
        "python-oslo-serialization>=1.10.0"
        "python-oslo-utils>=3.16.0"
        "python-os-client-config>=1.13.1"
        "python-keystoneauth1>=2.10.0"
        "python-requests>=2.10.0"
        "python-simplejson>=2.2.0"
        "python-six>=1.9.0"
        "python-babel>=2.3.4"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

package_python2-neutronclient() {
    depends=(
        "python2-pbr>=1.6"
        "python2-cliff>=1.15.0"
        "python2-debtcollector>=1.2.0"
        "python2-iso8601>=0.1.11"
        "python2-netaddr>=0.7.12"
        "python2-osc-lib>=0.4.0"
        "python2-oslo-i18n>=2.1.0"
        "python2-oslo-serialization>=1.10.0"
        "python2-oslo-utils>=3.15.0"
        "python2-os-client-config>=1.13.1"
        "python2-keystoneauth1>=2.7.0"
        "python2-requests>=2.10.0"
        "python2-simplejson>=2.2.0"
        "python2-six>=1.9.0"
        "python2-babel>=2.3.4"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
}
