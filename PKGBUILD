pkgname=dev_ink
pkgver=1.0.1
pkgrel=1
pkgdesc="A Gui program to create, save and sort different color themes, written in python. "
arch=('any')
url="https://github.com/Veicm/Dev_Ink"
license=('Apache')
depends=('python' 'tk' 'python-setuptools' 'python-customtkinter')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
conflicts=('dev_ink-git')
provides=('dev_ink')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "dev_ink.desktop"
)
md5sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir/Dev_Ink-$pkgver" # Manual intervention since repo and pkg name are different.
    python -m build --wheel
}

package() {
    cd "$srcdir/Dev_Ink-$pkgver" # Manual intervention since repo and pkg name are different.
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/dev_ink.desktop" "$pkgdir/usr/share/applications/dev_ink.desktop"
    install -Dm644 "$srcdir/Dev_Ink-$pkgver/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev_ink.png"
    install -Dm644 "$srcdir/Dev_Ink-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/Dev_Ink-$pkgver/dev_ink/db.json" "$pkgdir/usr/share/dev_ink/db.json"

}