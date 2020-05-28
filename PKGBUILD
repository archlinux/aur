# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=prince-books-bin
pkgver=20191125
pkgrel=1
pkgdesc="Prince for Books"
arch=(x86_64 i686)
url='https://www.princexml.com/books/'
license=('custom')
depends=('ca-certificates-utils' 'fontconfig' 'libidn' 'libxml2')
provides=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/license.dat")
source=('prince-books.sh')
source_x86_64=("https://www.princexml.com/download/${pkgname%-bin}-$pkgver-linux-generic-x86_64.tar.gz")
source_i686=("https://www.princexml.com/download/${pkgname%-bin}-$pkgver-linux-generic-i686.tar.gz")
sha256sums=('a963e51d3c414d2969c71ce66b2db0a72dede11401c62dc2befa8b870cd01284')
sha256sums_x86_64=('294ef279e00736fe4c7fc6bb262793f2bd0e602a74d78ba785b09cd6aa3f1b63')
sha256sums_i686=('c41d290153d354548869c77b3f6235fee406daa41bbc5461e58946c2af27132c')

prepare() {
    cd "${pkgname%-bin}-$pkgver-linux-generic-$CARCH"
    mkdir -p "etc/${pkgname%-bin}"
    mv lib/prince-books/license/license.dat "etc/${pkgname%-bin}/"
    ln -sf "../../../../etc/${pkgname%-bin}/license.dat" lib/prince-books/license
    ln -sf "../../../../etc/ssl/certs/ca-certificates.crt" lib/prince-books/etc/curl-ca-bundle.crt
}

package() {
    cd "${pkgname%-bin}-$pkgver-linux-generic-$CARCH"
    install -Dm755 "../${source[0]}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-bin}" LICENSE CREDITS
    install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-bin}" README
    install -Dm644 -t "$pkgdir/etc/${pkgname%-bin}/" "etc/${pkgname%-bin}/license.dat"
    mkdir -p "$pkgdir/usr/lib/"
    cp -a lib/prince-books "$pkgdir/usr/lib/"
}
