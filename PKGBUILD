# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: amodi444 <amodiii444@gmail.com>
pkgname=scrapfetch-git
pkgver=r9.9650db3
pkgrel=1
pkgdesc="A tool for fetching system information. Written in C for Linux."
arch=('x86_64')
url="https://github.com/amodi444/scrapfetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=('scrapfetch')
conflicts=('scrapfetch')
source=("${pkgname}::git+https://github.com/amodi444/scrapfetch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install

    # Install license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
