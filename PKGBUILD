# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="asus-5606-fan-state"
pkgname="${_pkgname}-git"
pkgver=r16.02df875
pkgrel=1
pkgdesc="Script to set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
depends=('bash')
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    printf "%b" "\n\n-----------------------\nInstalled as \e[1;34mfan_state\e[0m\n-----------------------\n\n"
}

package() {
    install -Dm755 "$srcdir"/"$_pkgname"/fan_state "$pkgdir/usr/bin/fan_state"
    install -Dm644 "$srcdir"/"$_pkgname"/README.md "$pkgdir/usr/share/doc/fan_state"
}
