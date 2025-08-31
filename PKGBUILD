# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jamo
_name=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
epoch=
pkgdesc="A Hangul syllable and jamo analyzer."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(Apache-2.0)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    # AUR
)
makedepends=(
    autopep8
    python-flake8
    python-build
    python-installer
    python-wheel
    python-setuptools
)
checkdepends=(python-nose2)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ea65cf9d35338d0e0af48d75ff426d8a369b0ebde6f07051c3ac37256f56d025')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #     install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
