# Maintainer: ericdahl-dev
pkgname=omarchy-wled
pkgver=0.1.4
pkgrel=1
pkgdesc="Sync Omarchy theme accent or wallpaper color to a WLED device"
arch=('any')
url="https://github.com/ericdahl-dev/omarchy-wled"
license=('MIT')
depends=('python' 'python-watchdog' 'python-pillow')
makedepends=('python-hatchling' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3a42164c2e7e3718e0f4ab75daae15c560b57bb3572427423bc8de903c001b11')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m hatchling build --target wheel
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

    # systemd user service
    install -Dm644 omarchy-wled@.service \
        "$pkgdir/usr/lib/systemd/user/omarchy-wled@.service"
}
