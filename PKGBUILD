# Maintainer: jlaunay
pkgname=sway-trans-git
pkgver=r3.b00fdba
pkgrel=1
pkgdesc="sway-trans is a tiny bash utility that sets alpha attribute of a Sway window (like picom-trans on X11)"
arch=('any')
url="https://github.com/jlaunay/sway-trans"
license=("GPL")
depends=('bash' 'sway')
makedepends=('git')
provides=('sway-trans')
source=("git+https://github.com/jlaunay/${pkgname/-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
    cd "${pkgname/-git}"
    install -Dm755 ${pkgname/-git} "$pkgdir/usr/bin/${pkgname/-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-git}/LICENSE"
}
