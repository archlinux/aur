# Maintainer: 98WuG <aur@geraldwu.com>

_pkgname=passrofi
pkgname="$_pkgname"-git
pkgver=r1.2e8cada
pkgrel=1
pkgdesc="POSIX-compliant shell script to extend passmenu functionality to rofi. Extended to provide username, password, and OTP tokens to clipboard."
arch=('any')
url="https://github.com/98WuG/$_pkgname"
license=('GPL2')
makedepends=('git')
depends=('pass' 'rofi')
optdepends=('pass-otp: OTP support')
source=("git+https://github.com/98WuG/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/${_pkgname}"
}
