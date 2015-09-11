# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.2.2
pkgrel=1
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'libzip')
makedepends=('sbcl>=1.1.14' 'make' 'gawk' 'curl' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('82bd0574a476f4fae2620568f0232951')

prepare() {
    cd "$pkgname-$pkgver"

    cp "$srcdir/../LICENSE" .
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
