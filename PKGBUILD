# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=guile-minikanren-git
pkgver=0.1r13.e844d85
pkgrel=1
pkgdesc='A relational programming extension to Scheme'
arch=(any)
license=('MIT')
depends=('guile')
makedepends=('git')
url="http://minikanren.org/"
source=('git+https://github.com/ijp/minikanren')
sha256sums=('SKIP')

pkgver() {
  cd minikanren
  printf "0.1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd minikanren
    guild compile -L . --r6rs -o minikanren.go minikanren.scm
    guild compile -L . --r6rs -o minikanren/mk.go minikanren/mk.scm
    guild compile -L . --r6rs -o minikanren/mkextraforms.go minikanren/mkextraforms.scm
    guild compile -L . --r6rs -o minikanren/mkprelude.go minikanren/mkprelude.scm
}

package() {
    cd minikanren
    install -Dm644 minikanren.scm "$pkgdir/usr/share/guile/site/3.0/minikanren.scm"
    install -Dm644 minikanren/mk.scm "$pkgdir/usr/share/guile/site/3.0/minikanren/mk.scm"
    install -Dm644 minikanren/mkextraforms.scm "$pkgdir/usr/share/guile/site/3.0/minikanren/mkextraforms.scm"
    install -Dm644 minikanren/mkprelude.scm "$pkgdir/usr/share/guile/site/3.0/minikanren/mkprelude.scm"

    install -Dm644 minikanren.go "$pkgdir/usr/lib/guile/3.0/site-ccache/minikanren.go"
    install -Dm644 minikanren/mk.go "$pkgdir/usr/lib/guile/3.0/site-ccache/minikanren/mk.go"
    install -Dm644 minikanren/mkextraforms.go "$pkgdir/usr/lib/guile/3.0/site-ccache/minikanren/mkextraforms.go"
    install -Dm644 minikanren/mkprelude.go "$pkgdir/usr/lib/guile/3.0/site-ccache/minikanren/mkprelude.go"
}
