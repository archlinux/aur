# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=xiaomi-region-detector
pkgver=1.0.0
pkgrel=1
pkgdesc="Detect the firmware region of a Xiaomi device from its build number (CLI)"
arch=('any')
url="https://github.com/user14923929/XiaomiRegionDetector"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=('android-tools: read the build number from a device with "xrd useadb"')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cade1f8eb5a524455cc2adae2d55cd5c2daf08ffa9afd64dedcdc56a72dea496')

build() {
    cd "XiaomiRegionDetector-$pkgver/cli"
    python -m build --wheel --no-isolation
}

check() {
    cd "XiaomiRegionDetector-$pkgver/cli"
    python -m unittest discover -s tests
}

package() {
    cd "XiaomiRegionDetector-$pkgver"
    python -m installer --destdir="$pkgdir" cli/dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
