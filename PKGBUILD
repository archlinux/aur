# Maintainer: Codemorra <238960954+codemorra@users.noreply.github.com>

pkgname=bulk-rename-py
pkgver=1.0.1
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
  "LICENSE"
  "THIRD_PARTY_LICENSES.txt"
)

sha256sums=('f0112950e7675689208c2cef08e38d371ea0628994ba3461acd9f5d0fd6842a5'
            '93b90151b604712de4bc0526b8193debaea462a9aac99303b8cd973aced3c969'
            '5cfea4b932e8e753e3f664cadb7adc7924a1606d5160fc3c0c606b5325bac7be')

package() {
    cd "$srcdir/bulk-rename-py-$pkgver"

    # program files
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
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_LICENSES.txt \
      "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.txt"
}
