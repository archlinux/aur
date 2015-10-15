# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"

pkgname="${_name}"
pkgver="2.1.0"
pkgrel="1"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
makedepends=("python-setuptools")
conflicts=("python-supernova" "python-supernova-git" "supernova-git")
replaces=("supernova2")
source=("${url}/archive/v${pkgver}.tar.gz")
#source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('94e37b461545d21c76c8bc468d567df2a2442da3f4f03258124fd57c7fe268c5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python-click"
             "python-configobj"
             "python-keyring>=0.9.2"
             "python-novaclient"
             "python-six")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "contrib/${_name}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_name}"
}
