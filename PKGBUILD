# Maintainer: redponike <proton (dot) me>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>

_pkgname=x_transformers
pkgname=python-x-transformers
pkgver=2.1.15
pkgrel=1
pkgdesc="A concise but complete full-attention transformer with a set of promising experimental features from various papers"
arch=('x86_64')
url="https://github.com/lucidrains/x-transformers"
license=('MIT')
depends=(python-einops python-einx python-pytorch python-packaging python-loguru)
makedepends=(python-installer python-build python-wheel)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('90ada1868ee394724587a9524494680f8e4e2019ffded4969a50a4debf4ae29a')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest -vv
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
