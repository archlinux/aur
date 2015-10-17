# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.2.2
pkgrel=3
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('zlib')
makedepends=('sbcl>=1.1.14' 'make' 'gawk' 'curl' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('5fe5c115e277a9dd616b1077f89bffdf978bc6983ce62d99af9a218142c39e40'
            'b34067e89373e1a47367b454862f43061ad1680542b39b6d95ed29c354473e15')

prepare() {
    cd "$pkgname-$pkgver"

    patch -p1 < ${srcdir}/../0001-Adapt-to-the-new-cl-ixf-API.patch
}

build() {
    cd "$pkgname-$pkgver"

    make pgloader
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/bin/pgloader "$pkgdir/usr/bin/pgloader"
    install -Dm755 pgloader.1 "$pkgdir/usr/share/man/man1/pgloader.1"
}
