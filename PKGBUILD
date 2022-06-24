# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=pgloader
pkgver=3.6.4
pkgrel=1
pkgdesc='A data loading tool for PostgreSQL, using the COPY command.'
arch=('x86_64')
url="http://pgloader.io/"
license=('custom:PostgreSQL')
depends=('freetds' 'zlib')
makedepends=('sbcl>=1.2.5' 'gawk' 'curl' 'quicklisp' 'sqlite' 'unzip')
source=("https://github.com/dimitri/$pkgname/archive/v$pkgver.tar.gz" 'LICENSE')
sha256sums=('abbf3d8d3b4e51cd1e8140bf96ef73d5c1936060923dbf04c5684096bdea1b03'
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
