 # Maintainer: Buzzkillb <buzzkillb @ protonmail.com>

pkgname='denariusqt-git'
pkgver=v3.3.9.13.r10.gddc48ef
pkgrel=1
pkgdesc="Denarius (D) is an anonymous, untraceable, energy efficient, Proof-of-Work, and Proof-of-Stake cryptocurrency."
arch=('x86_64')
url="https://denarius.io"
license=('MIT')
depends=('miniupnpc' 'libevent' 'openssl-1.0' 'boost-libs' 'libcurl-compat' 'qt5-base' 'qt5-tools' 'protobuf' 'qrencode')
makedepends=('git' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  'git+https://github.com/carsenk/denarius.git'
)
sha512sums=('SKIP')
options=(!buildflags)

pkgver() {
    cd denarius
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/denarius"
    qmake "USE_UPNP=1" "USE_QRCODE=1" "USE_NATIVETOR=-" OPENSSL_LIB_PATH=/usr/lib/openssl-1.0 OPENSSL_INCLUDE_PATH=/usr/include/openssl-1.0 denarius-qt.pro
    make
}

package() {
    install -Dm755 "$srcdir/denarius/Denarius" "$pkgdir/usr/bin/Denarius"
    install -Dm644 "$srcdir/denarius/COPYING" "$pkgdir/usr/share/licenses/denariusqt-git/LICENSE"
}
