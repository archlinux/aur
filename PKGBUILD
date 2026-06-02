# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=guile-pstk-git
pkgver=r17.70396a6
pkgrel=1
pkgdesc='PS/TK version fixed to work fine on modern GNU Guile'
arch=(any)
license=('BSD-2-Clause')
depends=('guile' 'tk')
makedepends=('git')
url="https://github.com/KikyTokamuro/guile-pstk"
source=('guile-pstk::git+https://github.com/KikyTokamuro/guile-pstk.git')
sha256sums=('SKIP')

prepare() {
    cp guile-pstk/pstk.scm pstk.scm
}

pkgver() {
    cd guile-pstk
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
     guild compile -o pstk.go pstk.scm
}

package() {
    install -Dm644 pstk.scm "$pkgdir/usr/share/guile/site/3.0/pstk.scm"
    install -Dm644 pstk.go "$pkgdir/usr/lib/guile/3.0/site-ccache/pstk.go"
}
