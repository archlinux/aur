# Maintainer: aarto <aarto@aur.archlinux.org>
_pkgname=pynitrokey
pkgname=nitropy
pkgver=0.12.0
pkgrel=2
pkgdesc="CLI for the Nitrokey FIDO2, Nitrokey Start, Nitrokey 3, Nitrokey Passkey and NetHSM."
arch=('any')
url=https://github.com/Nitrokey/pynitrokey
license=('Apache-2.0 OR MIT')
depends=(
    python
    python-cffi
    python-click
    python-cryptography
    python-fido2
    python-intelhex
    python-libusb1
    python-nethsm
    python-nitrokey
    python-nkdfu
    python-pyscard
    python-pyserial
    python-pytest
    python-pyusb
    python-requests
    python-tlv8
    python-tqdm
    python-semver
)
makedepends=(
    python-build
    python-installer
    python-poetry-core
    python-wheel
)
checkdepends=(
    python-pytest
)
optdepends=(
    'ccid: CCID driver for smart card readers'
)
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('293706c0c063343ddba14b1767ed547914465089a2e1a35a7ebf57dee2b5b5df7a0e437a5f48971587d1f468465bbba6e015bcee0a2c6a060ad7db969948ddff')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    python -m pytest pynitrokey/test_*.py -v
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "$srcdir/$_pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSES/Apache-2.0.txt" "$pkgdir/usr/share/licenses/$pkgname/Apache-2.0.txt"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSES/MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT.txt"
}
