pkgname=uaspl
pkgver=2.0.0
pkgrel=2
pkgdesc="Utilidad Automatizada para la Seguridad y Protección en Linux"
arch=('any')
url="https://github.com/KevinCrrl/UASPL"
license=('GPL3 and MIT')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("2f72ef00b7de099627a7b2119b4bf0ae23f87f3412ff538b51ee9a11a745a52ae21053d098d749b63817e0d01c0655c81d36e2c404800fd0841f0a5ca4a7d572")
conflicts=('uaspl-bin')
depends=(
    'python'
    'python-customtkinter'
    'python-pyxdg'
    'python-jsonschema'
    'polkit'
    'clamav'
    'rkhunter'
    'ufw'
    'systemd'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)

build() {
    _uaspldir="$srcdir/UASPL-$pkgver"
    cd "$_uaspldir/src/"
    python -m build --wheel --no-isolation
}

package() {
    _uaspldir="$srcdir/UASPL-$pkgver"
    cd "$_uaspldir/src/"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm755 "$_uaspldir/src/uasplc_sh/uasplc.sh" "$pkgdir/usr/bin/uasplc"
    install -Dm644 "$_uaspldir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_uaspldir/src/UASPL.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/UASPL.png"
    install -Dm644 "$_uaspldir/src/UASPL.desktop" "$pkgdir/usr/share/applications/UASPL.desktop"
}
