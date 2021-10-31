# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=gemgen
pkgver=0.4.0
pkgrel=2
pkgdesc="A Markdown to Gemtext generator"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~kota/gemgen/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kota/gemgen/archive/v$pkgver.tar.gz")
depends=('glibc')
makedepends=('go' 'scdoc')
sha256sums=('ffde5b78e0148b2cc8b3a67831e9d04d0403c4a7aa227812e030a23b74b87116')

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    export GOFLAGS='-buildmode=pie'
    export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
    export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
    make all
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
