# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="asus-5606-fan-state"
pkgname="${_pkgname}-git"
pkgver=r18.7c00387
pkgrel=1
pkgdesc="Script to set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
depends=('bash')
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
install="${_pkgname}.install"

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    install -Dm755 "$srcdir/$_pkgname"/fan_state "$pkgdir/usr/bin/fan_state"
    install -Dm644 "$srcdir/$_pkgname"/asus-fan-permissions.service "$pkgdir/usr/lib/systemd/system/asus-fan-permissions.service"
    install -Dm644 "$srcdir/$_pkgname"/README.md "$pkgdir/usr/share/doc/fan_state"
}
