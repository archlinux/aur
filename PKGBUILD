# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_pkgname=cq
pkgname="$_pkgname"-csv
pkgver=1.2.0
pkgrel=2
pkgdesc="High-Performance SQL Query Engine for CSV Files"
arch=('x86_64')
url="https://github.com/baldimario/$_pkgname"
license=('MIT')

depends=('glibc')
makedepends=('git')
conflicts=("$pkgname"-git)

source=(
    "git+$url#tag=v$pkgver"
    "LICENSE"
    "force_full_relro.patch"
)
sha256sums=(
    'SKIP'
    'ba6588e9527848b8eb57c0c09727cd3e981167fef72ad53575b5c8bacd8a39b7'
    '1a0cd057b465a2f53e127b253506ef3fa79014677a4cb02d26d6481022fc9f22'
)

build() {
    cd "$_pkgname"
    patch -p1 -F0 -i "${srcdir}/force_full_relro.patch"
    make
}

package() {
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/MIT
    
    cd "$_pkgname"/build
    install -D -m755 "$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
}

