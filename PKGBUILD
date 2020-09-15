# Maintainer: aurelien.grosdidier+archlinux@gmail.com
_pkgname=fclones
pkgname=${_pkgname}-git
pkgver=v0.8.0
pkgrel=2
pkgdesc='Efficient Duplicate File Finder'
arch=('i686' 'x86_64')
url="https://github.com/pkolaczk/fclones"
license=('MIT')
depends=()
makedepends=('rust' 'cargo' 'git')
provides=('fclones')
conflicts=('fclones')
source=("git+https://github.com/pkolaczk/fclones")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags \
      | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$_pkgname" \
    && cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "target/release/fclones" "$pkgdir/usr/bin/fclones"
    mkdir -p  "$pkgdir/usr/share/licenses/fclones-git/"
    install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/fclones-git/"
}
