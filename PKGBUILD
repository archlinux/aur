# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

_pkgname=dazzle
pkgname=${_pkgname}-git
pkgver=r32.8b5a4fa
pkgrel=1
pkgdesc="An AI playground (git version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dariost/dazzle"
license=('MPL2')
depends=()
makedepends=('cargo')
provides=('dazzle')
backup=('etc/dazzled.json')
options=()
source=("git+https://github.com/dariost/dazzle.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/dazzle "$pkgdir/usr/bin/dazzle"
    install -Dm755 target/release/dazzled "$pkgdir/usr/bin/dazzled"
    install -Dm644 contrib/dazzled.json "$pkgdir/etc/dazzled.json"
}
