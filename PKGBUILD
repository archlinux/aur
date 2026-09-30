# Maintainer: Noah Vogt <noah@noahvogt.com>
# Contributor: Sean Blackburn <birdicode@gmail.com>

pkgname=openconnect-ms-auth
pkgver=0.5.0
pkgrel=1
pkgdesc="Fetch an openconnect webvpn cookie from an MFA enabled Microsoft account"
arch=('any')
url="https://github.com/noahvogt/openconnect-ms-auth"
license=('MIT')
depends=('python' 'python-selenium' 'python-pyotp' 'geckodriver' 'firefox')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest')
optdepends=('openconnect: to connect with the fetched cookie'
    'networkmanager-openconnect: to hand the cookie to NetworkManager')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Filled in by scripts/bump, which runs updpkgsums against the tag.
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="$PWD" pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
