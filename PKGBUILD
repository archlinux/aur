# Maintainer: kekmacska

pkgname=spacequilt-git
pkgver=fcf931d
pkgrel=1
pkgdesc="Disk usage as a SpaceMonger-style nested map or xdiskusage-style icicle columns (PySide6, du-based)"
arch=('any')
url="https://github.com/emoryy/spacequilt"
license=('MIT')
depends=('python' 'zlib' 'pyside6') # based on imports
makedepends=('git' 'svgo')
source=("git+$url.git" "${pkgname%-*}.desktop")
b2sums=('SKIP'
        '1f4b4a3976bdf8a65bca333d05987a952d6a14d3ae7b610c7ea4a62b5362eb96cb13da28a12a55fa8955497fe279a319465cd9c00f64c3912165d681c4d61ac7')


pkgver() {
    cd "${pkgname%-*}"
    git describe --tags --long --always | sed -E 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  svgo . -r --multipass
}

package() {
    cd "${pkgname%-*}"

    # Install executable
    install -Dm755 "${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"

    # Install desktop file
    install -Dm644 "$srcdir/${pkgname%-*}.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"

    # Install icon
    install -Dm644 "$srcdir/${pkgname%-*}/${pkgname%-*}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-*}.svg"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
