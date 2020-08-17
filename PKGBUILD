pkgname=lighthouse-ethereum
pkgver=0.2.4
_pkgname=lighthouse
_commit=9a97a0b14fdcd265769981a02e9cb37dac3b553a
pkgrel=1
pkgdesc='Ethereum 2.0 client'
arch=('x86_64')
url='https://lighthouse.sigmaprime.io/'
license=('Apache License 2.0')
depends=('openssl')
makedepends=('cargo' 'cmake')
provides=('lighthouse')
conflicts=('lighthouse')
replaces=('lighthouse')
source=("git+https://github.com/sigp/lighthouse.git#commit=${_commit}")
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
