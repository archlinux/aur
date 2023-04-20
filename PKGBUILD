pkgname=lighthouse-ethereum
pkgver=4.1.0
_pkgname=lighthouse
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache License 2.0')
depends=('openssl')
makedepends=('cargo' 'cmake' 'clang' 'protobuf')
provides=('lighthouse')
conflicts=('lighthouse')
replaces=('lighthouse')
source=("git+https://github.com/sigp/lighthouse.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd ${_pkgname}
    env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
    cd ${_pkgname}

    install -D -m755 "$srcdir/$_pkgname/target/release/lighthouse" "$pkgdir/usr/bin/lighthouse"
    install -D -m644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
