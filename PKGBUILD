# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kiauto
_name=${pkgname#python-}
pkgver=2.3.5
pkgrel=1
epoch=
pkgdesc="KiCad automation scripts. In particular to automate tasks that can't be done using the KiCad native Python interface. The automation is carried out emulating the user interaction."
arch=('any')
url="https://pypi.org/project/kiauto"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(
    glibc
    python
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
sha256sums=('59f3783a7022f2dd11942e5ca2e55d6a6450efa6227a50eb012d960eb7a0b2d2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    # https://wiki.archlinux.org/index.php/Python_package_guidelines
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}
