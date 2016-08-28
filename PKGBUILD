# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.3.1
pkgrel=1
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'zlib')
makedepends=('sbcl>=1.1.14' 'gawk' 'curl' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('f9741a2851ddc421214545308a7ad4db4e4744c5dea8391a72ba8fd59b133c88'
            'b34067e89373e1a47367b454862f43061ad1680542b39b6d95ed29c354473e15')
options=(!strip)

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
