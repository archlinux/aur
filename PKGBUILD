# Maintainer: vianney <v at bouchaud dot org>
pkgname="mcabber-module-pep-hg"
pkgver=r44.636ef7fe3d5b
pkgrel=1
pkgdesc="'Pep' module provides common listener for incoming PEP events."
url="http://www.isbear.org.ua/docs/mcabber-cmd/index/"
arch=('any')
license=('GPL')
depends=('mcabber-hg' 'loudmouth')
makedepends=('mercurial')
source=(${pkgname}::hg+http://www.isbear.org.ua/hg/isbear/mcabber-pep)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build
    cd "build"

    cmake ..
    make
}

package() {
    install -D "$srcdir/$pkgname/build/libpep.so" "$pkgdir/usr/lib/mcabber/libpep.so"
}
