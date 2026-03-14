# Maintainer: Patrik Bures <patrik@pabu.dev>
pkgname=gamesync
pkgver=2.6.0
pkgrel=1
pkgdesc="Sync game saves with a server"
arch=('x86_64')
url="https://git.pabu.dev/PatrikBures/gamesync"
license=('GPL-3.0-or-later')
depends=(
    'rsync'
    'openssh'
)
makedepends=('go>=1.24')
source=("https://gitlab.com/PatrikBures/gamesync/-/archive/v${pkgver}/gamesync-v${pkgver}.tar.gz")
sha256sums=('7335810db30bba27cfda2ee5104c7d9717db646232509d355ff062aec03a628c')

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$pkgname-v$pkgver"
    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
    cd "$pkgname-v$pkgver"
    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
}
