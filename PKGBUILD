# Maintainer: liqoxowz <hoswt4s3321399@gmail.com>

pkgname=kabutam
pkgver=0.1.9
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
)

optdepends=(
    'pass: secret storage backend (default)'
    'libsecret: Secret Service secret storage backend'
)

makedepends=(
        'python-build' 
        'python-installer'
        'python-setuptools'
)

checkdepends=(
    'python-pytest'
)
source=($pkgname::git+https://codeberg.org/tonrl/$pkgname.git#tag=v$pkgver)
sha256sums=('b9726d49be2f73d80e43c70f74006486117941d74e96791366004543d427d946')
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
