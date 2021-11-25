# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=gemgen
pkgver=0.4.2
pkgrel=1
pkgdesc="A Markdown to Gemtext generator"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~kota/gemgen/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kota/gemgen/archive/v$pkgver.tar.gz")
depends=('glibc')
makedepends=('go' 'scdoc')
sha256sums=('71b112af8a3d577bf7ae8dbc7f0d3437e28fe92ae88de8d9e55792f3130944ea')

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
