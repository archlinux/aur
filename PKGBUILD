# Maintainer: Carl George < arch at cgtx dot us >

_name="python-glanceclient"
_module="${_name#python-}"
_cmd="${_module%client}"

#pkgname=("python-${_module}" "python2-${_module}")
pkgname="python-${_module}"
pkgver="0.18.0"
pkgrel="1"
pkgdesc="OpenStack Image API Client Library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
#makedepends=("python-pbr>=0.6" "python2-pbr>=0.6")
makedepends=("python-pbr>=0.6")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9784de057ffb8fadd98563452a9f30bfdca6d4531ce166ac2d101cd968a6194a')

prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
    sed -ri '/argparse/d' requirements.txt
}

#package_python-glanceclient() {
package() {
    depends=("python-babel>=1.3"
             "python-keystoneclient>=1.1.0"
             "python-oslo-i18n>=1.5.0"
             "python-oslo-utils>=1.4.0"
             "python-prettytable>=0.7"
             "python-pyopenssl>=0.11"
             "python-requests>=2.2.0"
             "python-six>=1.9.0"
             "python-warlock>=1.0.1")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}"
}

#package_python2-glanceclient() {
#    depends=("python2-babel>=1.3"
#             "python2-keystoneclient>=1.1.0"
#             "python2-oslo-i18n>=1.5.0"
#             "python2-oslo-utils>=1.4.0"
#             "python2-prettytable>=0.7"
#             "python2-pyopenssl>=0.11"
#             "python2-requests>=2.2.0"
#             "python2-six>=1.9.0"
#             "python2-warlock>=1.0.1")
#    cd "${srcdir}/${_name}-${pkgver}"
#    python2 setup.py install --root="${pkgdir}" --optimize=1
#    mv "${pkgdir}/usr/bin/${_cmd}" "${pkgdir}/usr/bin/${_cmd}2"
#    install -Dm644 "tools/${_cmd}.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
#    sed -i '/complete -F/ s/$/2/' "${pkgdir}/usr/share/bash-completion/completions/${_cmd}2"
#}
