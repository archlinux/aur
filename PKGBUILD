# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="nerdfetch-git"
pkgver=r369.8fd252b
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
url="https://github.com/ThatOneCalculator/NerdFetch"
license=('MIT')
depends=()
optdepends=('nerd-fonts: NerdFont to show icons in fetch')
source=("git+$url.git")
noextract=()
provides=('nerdfetch')
conflicts=('nerdfetch')
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
    install -Dm644 "$srcdir"/NerdFetch/README.md "$pkgdir/usr/share/licenses/nerdfetch"
}
