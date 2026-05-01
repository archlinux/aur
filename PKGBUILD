# Maintainer: ericdahl-dev
pkgname=omarchy-wled
pkgver=0.1.0
pkgrel=1
pkgdesc="Sync Omarchy theme accent or wallpaper color to a WLED device"
arch=('any')
url="https://github.com/ericdahl-dev/omarchy-wled"
license=('MIT')
depends=('python' 'python-watchdog' 'python-pillow')
makedepends=('python-hatchling' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c419dec9d7cded783e5ac169748e862bc48e9767d42321e431c88d725f27d4d7')

build() {
    cd "$pkgname-$pkgver"
    python -m hatchling build --target wheel
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # systemd user service
    install -Dm644 omarchy-wled@.service \
        "$pkgdir/usr/lib/systemd/user/omarchy-wled@.service"
}
