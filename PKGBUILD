# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=annotatego-git
_pkgname=annotatego
pkgver=r7.e52c42d
pkgrel=1
pkgdesc='Creates sourcehut JSON annotations for Go source trees'
arch=('x86_64')
url='https://git.sr.ht/~sircmpwn/annotatego'
license=('LGPL3')
makedepends=('git' 'go')
provides=('annotatego')
conflicts=('annotatego')
source=("$_pkgname::git+https://git.sr.ht/~sircmpwn/annotatego")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (   set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    go build -o annotatego
}

package() {
    install -Dm755 "$srcdir/$_pkgname/annotatego" "$pkgdir/usr/bin/annotatego"
}
