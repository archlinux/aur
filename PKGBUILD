# Maintainer: jD91mZM2 <me@krake.one>
pkgname=ttf-open-relay-git
pkgver=r59.f3785dd
pkgrel=1
pkgdesc="Open-relay fonts from KreativeKorp"
url="https://github.com/kreativekorp/open-relay"
arch=("x86_64")
license=("OFL")
makedepends=()
optdepends=()
depends=()
source=("git+https://github.com/kreativekorp/open-relay")
sha256sums=('SKIP')

pkgver() {
    cd open-relay
    (
      set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )

}

package() {
    for D in open-relay/*; do
        if test -f "$D"; then continue; fi
        if ! test -f "$D/OFL.txt"; then continue; fi
        install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/$D" "$D/"*.ttf
        install -Dm644 -t "$pkgdir/usr/share/licenses/$D" "$D/OFL.txt"
    done
}
