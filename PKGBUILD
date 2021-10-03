# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=gemgen
pkgver=0.3.0
pkgrel=2
pkgdesc="A Markdown to Gemtext generator"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~kota/gemgen/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kota/gemgen/archive/v$pkgver.tar.gz")
depends=('glibc')
makedepends=('go' 'scdoc')
sha256sums=('d61b77927b51fde4f74ac764dbd56e32fbb7294974e9edddb947b72d36a9cb0b')

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
