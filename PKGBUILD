# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kbd-ergol-git
_pkgname=kbd-ergol
pkgdesc="Ergo‑L layout in keymap format for linux console"
pkgver=0.0.0.r33.ae49223
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://codeberg.org/Alerymin/kbd-ergol"
# license=('')
conflicts=('kbd-ergol')
provides=('kbd-ergol')
makedepends=(
    'git'
    'gzip'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags || echo "0.0.0-r$(git rev-list --count --all)-$(git describe --long --tags --always)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://codeberg.org/Alerymin/kbd-ergol#branch=main"
)

sha256sums=(
    "SKIP"
)

build() {
    cd "$srcdir/$_pkgname"

    gzip -kv *.map
}

package() {
    for map in $(find "$srcdir/$_pkgname" -name "*.map.gz" -type f); do
        install -D -m0644 "$map" "$pkgdir/usr/share/kbd/keymaps/i386/ergol/$(basename $map)"
    done
}
