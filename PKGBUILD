# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tkintertools-mpl
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=1
epoch=
pkgdesc="Extension package for tkintertools to matplotlib."
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_name=${_name//-/_}
depends=(
    python
    python-matplotlib
    python-typing_extensions
    #AUR
    python-tkintertools
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('70169a55cbaa505886b557d5f9685553de18df1d026be76d3c378cd8ca00e00a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
