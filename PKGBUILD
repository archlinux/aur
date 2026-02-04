pkgname=uaspl
pkgver=2.1.1
pkgrel=1
pkgdesc="Utilidad Automatizada para la Seguridad y Protección en Linux"
arch=('any')
url="https://github.com/KevinCrrl/UASPL"
license=('GPL3 and MIT')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("9fc33d5d84808bb5a6181a9af1a164bf866bad6457877eec45c43d637c5e7c5be45ed905934de36ac58679dc7a24bba6fa6dda317d8a4cc6948470287959d787")
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
