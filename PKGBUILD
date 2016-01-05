# Maintainer: vianney <v at bouchaud dot org>
pkgname="mcabber-module-cmd-hg"
pkgver=r38.f195352808fb
pkgrel=1
pkgdesc="Send a command output to your buddy"
url="http://www.isbear.org.ua/docs/mcabber-cmd/index/"
arch=('any')
license=('GPL')
depends=('mcabber-hg')
makedepends=('mercurial')
source=(${pkgname}::hg+http://www.isbear.org.ua/hg/isbear/mcabber-cmd)
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
    install -D "$srcdir/$pkgname/build/libcmd.so" "$pkgdir/usr/lib/mcabber/libcmd.so"
}
