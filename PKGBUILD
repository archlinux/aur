# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=qmic-git
_pkgname=qmic
pkgver=0.1.r13.g815dd49
pkgrel=1
pkgdesc="QMI IDL compiler"
arch=(x86_64)
url="https://github.com/andersson/qmic"
license=(BSD)
makedepends=(git)
provides=(qmic)
conflicts=(qmic)
source=("git+https://github.com/andersson/qmic")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" prefix=/usr install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
