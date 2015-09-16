# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.2.0
pkgrel=4
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'libzip')
makedepends=('sbcl>=1.1.14' 'make' 'gawk' 'curl' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('461dd17d2643891f5add97e22fc8827a95521e3e39a6cca42677a950a7a1dfe0'
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

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/bin/pgloader "$pkgdir/usr/bin/pgloader"
    install -Dm755 pgloader.1 "$pkgdir/usr/share/man/man1/pgloader.1"
}
