# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-untokenize'
_pkgname='untokenize'
pkgver=0.1.1
pkgrel=2
pkgdesc='Transforms tokens into source code'
url='https://github.com/myint/untokenize'
checkdepends=()
depends=()
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=()
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "pyproject.patch::https://patch-diff.githubusercontent.com/raw/myint/untokenize/pull/7.patch"
)
sha256sums=('3865dbbbb8efb4bb5eaa72f1be7f3e0be00ea8b7f125c69cbd1f5fda926f37a2'
            'e38df1be0a4e34ab70f1994f9f863f8f572b92a767a3a959319182479cb4aeee')

prepare() {
    cd "${_pkgname}-${pkgver}"
    sed -i '1iinclude LICENSE' MANIFEST.in
    patch -p1 < ../pyproject.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wn
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$_pkgname-$pkgver"
  python test_untokenize.py
}

