pkgname=dev_ink-git
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc="A Gui program to create, save and sort different color themes, written in python. (Rolling release)"
arch=('any')
url="https://github.com/Veicm/Dev_Ink"
license=('Apache')
depends=('python' 'tk' 'python-setuptools' 'python-customtkinter')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
conflicts=('dev_ink')
provides=('dev_ink')
source=(
    "git+$url.git"
    "dev_ink.desktop"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/Dev_Ink"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || \
    echo "0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Dev_Ink" # Manual intervention since repo and pkg name are different.
    python -m build --wheel
}

package() {
    cd "$srcdir/Dev_Ink" # Manual intervention since repo and pkg name are different.
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/dev_ink.desktop" "$pkgdir/usr/share/applications/dev_ink.desktop"
    install -Dm644 "$srcdir/Dev_Ink/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev_ink.png"
    install -Dm644 "$srcdir/Dev_Ink/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/Dev_Ink/dev_ink/db.json" "$pkgdir/usr/share/dev_ink/db.json"

}