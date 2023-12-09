# Maintainer: Lobo Torres <lobo@praderi.es>

pkgname=loko-git
pkgver=0.12.1.r0.8be825b
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("EUPL-1.2-or-later")
makedepends=("chez-scheme" "akku")
options=(!strip)
conflicts=("loko")
source=("git+https://scheme.fail/git/loko.git/")
sha256sums=('SKIP')

pkgver()
{
    git -C loko describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build()
{
    cd loko
    make BOOTSTRAPSCHEME="chez-script" SCHEMESCRIPT="chez-script" PREFIX="/usr"
}

package()
{
    cd loko
    make DESTDIR="$pkgdir/" PREFIX="/usr" install install-info
    install -Dm644 LICENSES/EUPL-1.2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
