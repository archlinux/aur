# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-tf-playwright-stealth
_name=${pkgname#python-}
pkgver=1.1.1
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
sha256sums=('204322326a629542a92ad4ea0c48f37d6e22662cf560d81b69e6464cf2742ce3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
