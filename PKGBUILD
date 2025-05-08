# Maintainer: Graham Edgecombe <gpe@grahamedgecombe.com>
pkgname=postgresql-uint-git
pkgver=r89.2341277
pkgrel=1
pkgdesc="Unsigned integer types extension for PostgreSQL"
arch=('x86_64')
url="https://github.com/petere/pguint"
license=('PostgreSQL')
depends=('glibc' 'postgresql')
makedepends=('clang' 'git' 'llvm' 'python')
conflicts=('postgresql-uint')
provides=('postgresql-uint')
source=("$pkgname"::'git+https://github.com/petere/pguint')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
