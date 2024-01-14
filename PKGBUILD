# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=aur-builder
pkgver=1.1.0
pkgrel=1
pkgdesc='AUR Build Helper'
url='https://github.com/ryanpetris/aur-builder'
arch=('x86_64')
license=('GPL3')
depends=(
    'pacman'
    'git'
    'pacdb'
)
makedepends=(
    'go'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/${pkgname}/archive/v${pkgver}.tar.gz"
)
b2sums=(
    '4b86f8a32f1bb7a5c90e236b80db4137314bd2cd9b91e72adf4b3600c4949188d33445737cdd929fd45300f2eb65b018a3de691675c7d498fc85011924637e99'
)

build() {
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "${srcdir}/${pkgname}-${pkgver}"

    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX="/usr" install
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
