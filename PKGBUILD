# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kiauto
_name=${pkgname#python-}
pkgver=2.2.7
pkgrel=1
epoch=
pkgdesc="KiCad automation scripts. In particular to automate tasks that can't be done using the KiCad native Python interface. The automation is carried out emulating the user interaction."
arch=('any')
url="https://pypi.org/project/kiauto"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
    python-xvfbwrapper
    python-psutil
)
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('bb73f968d977684a704cdb72117df2f0c72beb7bc4f4b7f4c8c485ac268d620e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
