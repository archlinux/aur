# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="asus-5606-firmware-check"
pkgname="${_pkgname}-git"
pkgver=r9.922a5e9
pkgrel=1
pkgdesc="Script to check if the UM5606 laptop has a BIOS/firmware update"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
depends=('bash' 'curl')
optdepends=('libnotify: send notification')
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
provides=("$_pkgname")
install="${_pkgname}.install"

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    install -Dm755 "$srcdir/$_pkgname"/asus_firmware_check "$pkgdir/usr/bin/asus_firmware_check"
    install -Dm644 "$srcdir/$_pkgname"/README.md "$pkgdir/usr/share/doc/asus_firmware_check"
}
