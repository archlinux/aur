# Maintainer: Codemorra <238960954+codemorra@users.noreply.github.com>

pkgname=bulk-rename-py
pkgver=1.1.0
pkgrel=1
pkgdesc="Graphical Python application for bulk file renaming"
arch=('any')
url="https://github.com/codemorra/bulk-rename-py"
license=('MIT')

depends=(
  'python'
  'pyside6'
  'shiboken6'
  'python-requests'
)

source=(
  "https://github.com/codemorra/bulk-rename-py/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('5d1f255bd2a53f77937083ec9cf7442570ed449ccb347de5329e5d068a22145a')

package() {
    cd "$srcdir/bulk-rename-py-$pkgver"

    # Program files
    install -d "$pkgdir/usr/lib/bulk-rename-py"
    cp -r src/* "$pkgdir/usr/lib/bulk-rename-py/"

    # Launcher
    install -Dm755 packaging/linux/bulk-rename-py \
        "$pkgdir/usr/bin/bulk-rename-py"

    # Desktop entry
    install -Dm644 packaging/linux/bulk-rename-py.desktop \
        "$pkgdir/usr/share/applications/bulk-rename-py.desktop"

    # Icons
    for size in 16 32 64 128 256 512; do
        install -Dm644 "assets/icons/png/bulk-rename-py_${size}.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/bulk-rename-py.png"
    done

    # Licenses
    install -d "$pkgdir/usr/lib/bulk-rename-py/licenses"

    install -Dm644 LICENSE "$pkgdir/usr/lib/bulk-rename-py/licenses/LICENSE"
    install -Dm644 THIRD_PARTY_LICENSES.txt "$pkgdir/usr/lib/bulk-rename-py/licenses/THIRD_PARTY_LICENSES.txt"

    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/lib/bulk-rename-py/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ln -s "/usr/lib/bulk-rename-py/licenses/THIRD_PARTY_LICENSES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.txt"
}
