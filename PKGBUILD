# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tf-playwright-stealth
_name=${pkgname#python-}
pkgver=1.1.2
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
sha256sums=('d9f78890940c1d1de5b73c366f68930a206bd62d7a06aba4be32fc222ba058b4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
