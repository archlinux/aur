# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch"
pkgver=r322.bff2f70
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('MIT')
depends=('which')
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/NerdFetch"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir"
}

package() {
    install -Dm755 "$srcdir"/NerdFetch/nerdfetch "$pkgdir/usr/bin/nerdfetch"
    install -Dm644 "$srcdir"/NerdFetch/README.md "$pkgdir/usr/share/doc/$pkgname"
}
