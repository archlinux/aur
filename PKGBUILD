# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpfile
_name=${pkgname//-/_}
pkgver=0.0.5.1
pkgrel=1
epoch=
pkgdesc="Python httpfile."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-poetry
    #AUR
    python-asynctools
    python-filewrap
    python-http-response
    python-urlopen
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('cc6c8d8a9d197829f91651c8bf21056a977716a445cd4e73d26e989b4adb0a05')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
