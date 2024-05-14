# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.6.10
pkgrel=2
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'zlib')
makedepends=('sbcl>=1.2.5' 'gawk' 'curl' 'quicklisp' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('1ff25d5cebca58f095ad8eacf5f5a89e8b4b43d78fc307bc00044016095ef46c'
            'b34067e89373e1a47367b454862f43061ad1680542b39b6d95ed29c354473e15')
options=(!strip !makeflags)

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/bin/pgloader "$pkgdir/usr/bin/pgloader"
}
