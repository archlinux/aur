pkgname=lumiere
pkgver=0.1.0
pkgrel=1
pkgdesc='Minimal TUI to control display brightness, keyboard backlight, and night mode'
arch=('any')
url='https://github.com/msahores/lumiere'
license=('MIT')
depends=('python' 'brightnessctl')
optdepends=('gammastep: night mode / color temperature control')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ddc2ae432cf77811d5a8d729e0eb933728a6c6cbb2863fec28fbafc3bcd98ea6')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
