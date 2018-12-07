# Maintainer: Allen Wild <allenwild93@gmail.com>
pkgname=rundaemon
pkgver=1.0
pkgrel=1
pkgdesc="Simple program to daemonize anything"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://github.com/aswild/rundaemon"
license=('custom:Unlicense')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('877929d346f9a088c2f85da1cabe1f45f5c61d1f2edf73712c06c9ff8e27e17c')

_makeargs=(VERSION=${pkgver} PREFIX=/usr)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make "${_makeargs[@]}"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make "${_makeargs[@]}" DESTDIR="$pkgdir" install
    install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
