pkgname=vexa-git
pkgver=r163.g9688af4
pkgrel=1
pkgdesc="Modern cross-platform graphics framework in C++23"
arch=('x86_64')
url="https://github.com/monjaris/vexa"
license=('MIT')

makedepends=('git' 'xmake' 'cmake' 'ninja' 'pkgconf')
depends=('gcc-libs')

provides=('vexa')
conflicts=('vexa')

source=("vexa::git+https://github.com/monjaris/vexa.git")
sha256sums=('SKIP')


package() {
    cd "$srcdir/vexa"

    # Shared library
    install -Dm755 libvexa.so \
        "$pkgdir/usr/lib/libvexa.so"

    # Public headers
    install -d "$pkgdir/usr/include/vexa"
    cp -r include/vexa/. "$pkgdir/usr/include/vexa/"

    # pkg-config
    install -Dm644 packaging/pkgconfig/vexa.pc.in \
        "$pkgdir/usr/lib/pkgconfig/vexa.pc"

    sed -i \
        -e 's|@PREFIX@|/usr|g' \
        -e "s|@VERSION@|$pkgver|g" \
        "$pkgdir/usr/lib/pkgconfig/vexa.pc"

    # License
    install -Dm644 LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
