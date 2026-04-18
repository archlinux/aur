# Maintainer: Saber0324 <saber 0324 at proton dot me>
# Contributor: Hog185 <hogman12333 at gmail dot com>
pkgname=lufus
pkgver=1.0.0_beta1
pkgrel=1
pkgdesc="Physical drive imaging and formatting utility for Linux written in Python"
arch=('any')
url="https://github.com/Hog185/Lufus"
license=('MIT')
depends=(
    'python'
    'python-psutil'
    'python-pyqt6'
    'python-pyudev'
    'python-requests'
    'python-packaging'
    'python-platformdirs'
    'qt6-base'
    'dosfstools'
    'ntfs-3g'
    'exfatprogs'
    'e2fsprogs'
    'udftools'
)
makedepends=(
    'uv'
    'python-installer'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Hog185/Lufus/archive/refs/tags/v1.0.0b1.tar.gz"
    "lufus.desktop"
)
sha256sums=('8a711b7c4be1fcd6a1fbb57217f32bc3e5ca7c48baf6454bbbf8956c664dfe46'
            'b883901dc9f8b4baf354976c3782a8c3c14e0fe77b6d744479fa3a6a797d876c')


build() {
    cd "Lufus-1.0.0b1"
    UV_NO_SYNC=1 uv build --wheel --no-sources
}

package() {
    cd "Lufus-1.0.0b1"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
    install -Dm644 ../lufus.desktop "$pkgdir/usr/share/applications/lufus.desktop"
    install -Dm644 src/lufus/gui/assets/lufus.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/lufus.png"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/lufus" << 'LAUNCHER'
#!/usr/bin/env python
from lufus.__main__ import main
main()
LAUNCHER
}
