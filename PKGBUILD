# Maintainer: Patrik Bures <patrik@pabu.dev>
pkgname=gamesync
pkgver=2.5.2
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
sha256sums=('38aad1cbce9d36a465706bb59b22ebf332da09259ab7ea2685a4c5b2ec05f76f')

build() {
    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-modcacherw"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}
