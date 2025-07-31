# Maintainer: Lobo Torres <lobo@quiltro.org>

pkgname=loko-git
pkgver=0.12.2.r21.19daaf4
pkgrel=1
pkgdesc="An optimizing R6RS Scheme compiler"
arch=('x86_64')
url="https://scheme.fail"
license=("EUPL-1.2-or-later")
makedepends=("chez-scheme" "akku")
options=(!strip)
conflicts=("loko")
source=("git+https://gitlab.com/weinholt/loko.git")
sha256sums=('SKIP')

pkgver()
{
    git -C loko describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build()
{
    cd loko
    make -j1 PREFIX="/usr" loko
}

package()
{
    cd loko
    make DESTDIR="$pkgdir/" PREFIX="/usr" install install-info
    install -Dm644 LICENSES/EUPL-1.2.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
