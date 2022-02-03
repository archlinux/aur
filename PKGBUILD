# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=gemgen
pkgver=0.5.1
pkgrel=1
pkgdesc="A Markdown to Gemtext generator"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~kota/gemgen/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kota/gemgen/archive/v$pkgver.tar.gz")
depends=('glibc')
makedepends=('go' 'scdoc')
sha256sums=('403795f69d89d4ebac24e9a39745f07b1bbf2f6bf0d0a22031d8ecc6a01c1007')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    make all
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
