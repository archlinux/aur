pkgname=python-jkey
pkgver=0.3.1
pkgrel=1
pkgdesc="Python library for password management and TOTP verification"
arch=('any')
url="https://github.com/imjiaoyuan/jkey"
license=('MIT')
depends=('python>=3.10' 'python-opencv>=4.9.0')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools>=61.0' 'uv')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8c3c7328328dabd76d11acdf2b8cf1bd5b2239c0553c236f342ea72b7b493d63')

build() {
    cd "jkey-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "jkey-$pkgver"

    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
