# Maintainer: Snogard <snogardb at gmail dot com>

pkgname=python-xz
pkgver=0.5.0
pkgrel=1
pkgdesc="Pure Python implementation of the XZ file format with random access support"
arch=('any')
url="https://github.com/Rogdham/python-xz"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('git' 'python-build' 'python-pytest' 'python-installer' 'python-setuptools-scm' 'python-wheel' 'python-pytest-cov')
options=(!emptydirs)
source=("${pkgname}-${pkgver}::git+https://github.com/Rogdham/python-xz#tag=v${pkgver}")
provides=("python-xz")
sha256sums=('2650dddf025a2fa1646773304a7195e0d9d906316256cb6c78019585e18852c6')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}