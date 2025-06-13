# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tf-playwright-stealth
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Makes playwright stealthy like a ninja!."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-playwright
    #AUR
    python-fake-http-header
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
_name=${_name//-/_}
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('7bb8d32d3e60324fbf6b9eeae540b8cd9f3b9e07baeb33b025dbc98ad47658ba')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
