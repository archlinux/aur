# Maintainer: Max <max@swk-web.com>

_pkgname=csv-diff
pkgname=python-${_pkgname}
pkgver=1.2
pkgrel=4
pkgdesc='Tool for viewing the difference between two CSV, TSV or JSON files.'
arch=('any')
url=''https://pypi.org/project/csv-diff/
license=('Apache')
depends=('python' 'python-dictdiffer' 'python-click')
makedepends=('python-setuptools' 'python-build' 'python-installer')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/simonw/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "improve-setup.diff")
sha256sums=('ff138de5bbe2a1c625b3f0ca07e03b5e5fdc19e154a8e56475362617bc36f86d'
            '036b5975cf36137ef8a09f4d0dfb73d0c6a2fb8ba26749a1c575b72cda5b67fe')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -N < "$srcdir"/improve-setup.diff
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build -wn
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    PYTHONPATH=build/lib pytest tests
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer -d "${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

