# Maintainer: Julian Pollinger <julian@pollinger.dev>
_symfpucommit="e6ac3af9c2c574498ea171c957425b407625448b"
pkgname=symfpu-cvc5
_pkgname=symfpu
pkgver=r20230627.e6ac3af
pkgrel=3
pkgdesc="A fork of SymFPU, a (concrete or symbolic) implementation of IEEE-754 / SMT-LIB flating-point for cvc5"
arch=(x86_64)
url="https://github.com/cvc5/symfpu"
license=('GPL3')
depends=()
makedepends=('bash' 'git')
source=("git+$url.git#commit=$_symfpucommit")
sha256sums=('SKIP')
provides=("symfpu=$pkgver")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git log -1 --format="%cd" --date=short | sed 's/-//g')" "$(git rev-parse --short HEAD)"

}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mkdir -p "$pkgdir/usr/include/$_pkgname"

    cp -r core "$pkgdir/usr/include/$_pkgname/core"
    cp -r utils "$pkgdir/usr/include/$_pkgname/utils"

    chmod -R 644 "$pkgdir/usr/include/$_pkgname"
    chmod 755 "$pkgdir/usr/include/$_pkgname"
    chmod 755 "$pkgdir/usr/include/$_pkgname/core"
    chmod 755 "$pkgdir/usr/include/$_pkgname/utils"
}
