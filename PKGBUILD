# Maintainer: Carl George < arch at cgtx dot us >

_name="supernova"

pkgname="${_name}"
pkgver="2.2.0"
pkgrel="2"
pkgdesc="Use novaclient with multiple OpenStack nova environments the easy way"
arch=("any")
url="https://github.com/major/${_name}"
license=("Apache")
depends=(
    "python-click"
    "python-configobj"
    "python-keyring>=0.9.2"
    "python-novaclient"
    "python-six"
)
makedepends=("python-setuptools")
conflicts=("python-supernova" "python-supernova-git" "supernova-git")
replaces=("supernova2")
source=("${url}/archive/v${pkgver}.tar.gz")
#source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('963134824c84df46a8868ebf9497ea39e9d80cb1468fabde69dc593c01b369d0')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -Dm644 "contrib/${_name}-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/${_name}"
}
