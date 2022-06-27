# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.6.6
pkgrel=1
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'zlib')
makedepends=('sbcl>=1.2.5' 'gawk' 'curl' 'quicklisp' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('35cb67e4a9ab486f02f68c32c4195c4b0b1e7e5a781c61336d2c075b861616c6'
            'b34067e89373e1a47367b454862f43061ad1680542b39b6d95ed29c354473e15')
options=('!strip' '!makeflags')

build() {
    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 build/bin/pgloader "$pkgdir/usr/bin/pgloader"
}
