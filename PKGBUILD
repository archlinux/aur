# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname='aprs-symbols-git'
_pkgname='aprs-symbols'
pkgver=r29.f2286a9
pkgrel=1
pkgdesc='aprs.fi APRS symbol set, high-resolution, vector'
arch=('any')
url='https://github.com/hessu/aprs-symbols'
license=('custom')
source=(
    "$_pkgname"::"git+https://github.com/hessu/$_pkgname.git"
)
sha256sums=(
    'SKIP'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$srcdir/$_pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$srcdir/$_pkgname" || exit 1
    for file in {aprs*,README.md}; do
        install -Dm 0644 $srcdir/$_pkgname/$file "$pkgdir"/usr/share/$_pkgname/$file
    done
    for file in png/*; do
        install -Dm 0644 $srcdir/$_pkgname/$file "$pkgdir"/usr/share/$_pkgname/$file
    done
    install -Dm 0644 $srcdir/$_pkgname/COPYRIGHT.md "$pkgdir"/usr/share/licenses/$_pkgname/COPYRIGHT.md
}
