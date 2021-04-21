# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=gamja-git
_pkgname=gamja
pkgver=r213.727331c
pkgrel=1
pkgdesc='Simple IRC web client'
arch=('any')
url="https://sr.ht/~emersion/gamja/"
license=('AGPL3')
makedepends=('npm')
provides=('gamja')
conflicts=('gamja')
source=("$_pkgname::git+https://git.sr.ht/~emersion/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    npm install --production
}

package() {
    install -dm755 "$pkgdir"/usr/share/webapps/gamja/
    cp -r "$srcdir/$_pkgname" "$pkgdir"/usr/share/webapps/
}
