pkgname=uaspl
pkgver=2.1.0
pkgrel=1
pkgdesc="Utilidad Automatizada para la Seguridad y Protección en Linux"
arch=('any')
url="https://github.com/KevinCrrl/UASPL"
license=('GPL3 and MIT')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("19ca197ff9cdd9dafefd1e5199c0ad932fd18ad7d4c2e192118fe706c5a99485e9deb9852f638f1d09f200b587149cb5aff6cb7b5ea8aa899dc59514860437d1")
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
