# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=jkey
pkgver=0.3.2
pkgrel=4
pkgdesc="Python library for password management and TOTP verification"
arch=('any')
url="https://github.com/imjiaoyuan/jkey"
license=('MIT')
depends=('python>=3.10' 'python-portalocker')
optdepends=('python-opencv: QR code scanning for jkey 2fa add')
provides=("python-jkey=$pkgver")
conflicts=('python-jkey')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3b5af006ed4b8a6e6bab51569a4074eb5d58a23ab2ff4a129c051d080ba707da')

build() {
    cd "jkey-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jkey-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
