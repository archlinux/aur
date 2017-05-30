# Maintainer: Carl George < arch at cgtx dot us >

_name="python-neutronclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-$_module" "python2-$_module")
pkgver=6.3.0
pkgrel=1
pkgdesc="CLI and Client Library for OpenStack Networking"
arch=("any")
url="https://github.com/openstack/$_name"
license=("Apache")
makedepends=("python-pbr>=2.0.0" "python2-pbr>=2.0.0")
source=("https://tarballs.openstack.org/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9bb478dd5a9eb3c6c7e14f00ad985b0949cd74f9d411fe37c1dc46725c795caf')

package_python-neutronclient() {
    depends=(
        "python-pbr>=2.0.0"
        "python-cliff>=2.6.0"
        "python-debtcollector>=1.2.0"
        "python-iso8601>=0.1.11"
        "python-netaddr>=0.7.13"
        "python-osc-lib>=1.5.1"
        "python-oslo-i18n>=2.1.0"
        "python-oslo-serialization>=1.10.0"
        "python-oslo-utils>=3.20.0"
        "python-os-client-config>=1.27.0"
        "python-keystoneauth1>=2.20.0"
        "python-keystoneclient>=3.8.0"
        "python-requests>=2.10.0"
        "python-simplejson>=2.2.0"
        "python-six>=1.9.0"
        "python-babel>=2.3.4"
    )
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D --mode 644 "tools/$_cmd.bash_completion" "$pkgdir/usr/share/bash-completion/completions/$_cmd"
}

package_python2-neutronclient() {
    depends=(
        "python2-pbr>=2.0.0"
        "python2-cliff>=2.6.0"
        "python2-debtcollector>=1.2.0"
        "python2-iso8601>=0.1.11"
        "python2-netaddr>=0.7.13"
        "python2-osc-lib>=1.5.1"
        "python2-oslo-i18n>=2.1.0"
        "python2-oslo-serialization>=1.10.0"
        "python2-oslo-utils>=3.20.0"
        "python2-os-client-config>=1.27.0"
        "python2-keystoneauth1>=2.20.0"
        "python2-keystoneclient>=3.8.0"
        "python2-requests>=2.10.0"
        "python2-simplejson>=2.2.0"
        "python2-six>=1.9.0"
        "python2-babel>=2.3.4"
    )
    cd "$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/$_cmd" "$pkgdir/usr/bin/${_cmd}2"
    install -D --mode 644 "tools/$_cmd.bash_completion" "$pkgdir/usr/share/bash-completion/completions/${_cmd}2"
    sed -i '/^complete/s/neutron$/neutron2/' "$pkgdir/usr/share/bash-completion/completions/${_cmd}2"
}
