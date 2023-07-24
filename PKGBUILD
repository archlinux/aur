# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kiauto
_name=${pkgname#python-}
pkgver=2.2.6
pkgrel=3
epoch=
pkgdesc="KiCad automation scripts. In particular to automate tasks that can't be done using the KiCad native Python interface. The automation is carried out emulating the user interaction."
arch=('any')
url="https://pypi.org/project/kiauto"
license=(Apache-2.0)
groups=()
provides=(${_name})
conflicts=(${_name})
depends=(python
    python-argparse
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
sha256sums=('0f240ced18965ba84ec2e79fa5556b64ea5082b103dfb0d1d09573f342a445d5')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
