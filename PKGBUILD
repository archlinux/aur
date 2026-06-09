# Maintainer: SwitchBros <switchbros@proton.me>
pkgname=easy-scsmodmanager
_app_id=io.github.switch_bros.EasySCSModManager
pkgver=1.4.0
pkgrel=1
pkgdesc="Mod and profile manager for Euro Truck Simulator 2 and American Truck Simulator"
arch=('any')
url="https://github.com/Switch-Bros/easy-scsmodmanager"
license=('GPL-3.0-or-later')
depends=(
    'hicolor-icon-theme'
    'python'
    'python-pyqt6'
    'python-pycryptodome'
    'python-vdf'
    'python-httpx'
    'python-pillow'
    'qt6-base'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-qt'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3f9ba1109282379412549ac99f36cf77256e792cd1b5b603262d79a3be861410')

build() {
    cd "easy-scsmodmanager-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "easy-scsmodmanager-$pkgver"
    QT_QPA_PLATFORM=offscreen pytest
}

package() {
    cd "easy-scsmodmanager-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "easy_scsmodmanager/resources/${_app_id}.desktop" \
        "$pkgdir/usr/share/applications/${_app_id}.desktop"
    install -Dm644 easy_scsmodmanager/resources/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
    install -Dm644 easy_scsmodmanager/resources/icon.png \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"
    install -Dm644 "easy_scsmodmanager/resources/${_app_id}.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/${_app_id}.metainfo.xml"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
