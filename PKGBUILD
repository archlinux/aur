# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
pkgname=csvtools-git
pkgver=r309.eb0315a
pkgrel=1
pkgdesc="GNU-alike tools for parsing RFC 4180 CSVs at high speed: csvcut, csvgrep, csvawk, csvpipe, csvunpipe"
arch=('any')
url="https://github.com/DavyLandman/csvtools"
license=('MIT')
makedepends=('git')
checkdepends=('openssl' 'sed')
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$srcdir/csvtools"
    make
}

check() {
    cd "$srcdir/csvtools"
    make test
}

package() {
    cd "$srcdir/csvtools"
    mkdir -p "$pkgdir/usr/bin"
    make prefix="$pkgdir/usr" install
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "$srcdir/csvtools"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
