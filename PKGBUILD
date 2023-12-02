# Maintainer: Joaquin Colonnello <joaquincolonnello@hotmail.com>

pkgname=python-indexed-bzip2
pkgver=1.5.0
pkgrel=2
pkgdesc="A parallelized bzip2 decoder with seek capability"
arch=('x86_64')
url="https://github.com/mxmlnkn/indexed_bzip2"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs)
_tag=84290abde51e5786feaf6869baf44657ce450f5f
source=("${pkgname}-${pkgver}::git+${url}.git#tag=$_tag")
provides=("indexed_bzip2")
sha384sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    git submodule update --init
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}/python/indexed_bzip2"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/python/indexed_bzip2"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
