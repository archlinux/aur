# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-hashtools
_name=${pkgname//-/_}
pkgver=0.0.3.3
pkgrel=1
epoch=
pkgdesc="Python hash tools."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-filewrap
    python-iterdir
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('f12e0b1d02bee20558b353ed9e1a72930e2a06d9df1c172d3e4db3921ca39bb4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
