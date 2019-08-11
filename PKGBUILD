#Maintainer: Sam Bazley <sambazley@protonmail.com>
pkgname=colortool-git
pkgver=20190811221313
pkgrel=1
pkgdesc="Tool for modifying colors"
arch=("i686" "x86_64")
url="https://gitlab.com/sambazley/colortool"
license=("ZLIB")
makedepends=()
depends=()
source=("git+https://gitlab.com/sambazley/colortool.git")
md5sums=("SKIP")

pkgver() {
    cd colortool
    git show -s --format=%ci HEAD | cut -d' ' -f1-2 | sed -r 's/[^0-9]//g'
}

build() {
    cd "$srcdir/colortool"
    make libcolortool.so colortool
}

package() {
    cd colortool
    make DESTDIR="$pkgdir" PREFIX=/usr install install-h install-so

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
