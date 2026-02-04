pkgname=uaspl
pkgver=2.1.1
pkgrel=1
pkgdesc="Utilidad Automatizada para la Seguridad y Protección en Linux"
arch=('any')
url="https://github.com/KevinCrrl/UASPL"
license=('GPL3 and MIT')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("0d58893d8b4c1e5fb712294e3b4c6fb5332747fd679a6cb7bbee5a6df3009daf7a1b631cf539e5cf910e3640eb3d7a73307397528a6183528b82ae8c205cd2fb")
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
