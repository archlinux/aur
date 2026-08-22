# Maintainer: liqoxowz <hoswt4s3321399@gmail.com>

pkgname=kabutam
pkgver=0.1.6
pkgrel=1
pkgdesc="Terminal-based stock and portfolio tracking tool"
arch=('any')
url="https://codeberg.org/tonrl/kabutam"
license=('GPL-3.0-or-later')
depends=(
        'python' 
        'python-requests'
        'python-yfinance'
        'python-wcwidth'
        'python-jpholiday'
        'pass'
)
makedepends=(
        'python-build' 
        'python-installer'
        'python-setuptools'
)

checkdepends=(
    python-pytest
)
source=($pkgname::git+https://codeberg.org/tonrl/$pkgname.git#tag=v$pkgver)
sha256sums=('61b8a5457257a0d6550061bf93966a13521aa6f8bf33b638dc6536007adb18bb')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
        cd "$pkgname"
        python -m pytest
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
