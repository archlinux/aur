# Maintainer: quest <quest@mac.com>
pkgname=token2-fido-bridge
pkgver=0.1.3
pkgrel=1
pkgdesc="Daemon exposing PC/SC smartcards (contact or NFC) as virtual FIDO2/WebAuthn USB-HID security keys"
arch=('x86_64' 'aarch64')
url="https://github.com/token2/token2-fido-bridge"
license=('MIT')
depends=('glibc' 'gcc-libs' 'pcsclite')
makedepends=('cmake')
optdepends=('ccid: driver for most USB smartcard/NFC readers')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('843d0ce1fc465b824cc8e506579a731a0a9a0f81dab8de335191890a1c08d2aa')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSTATIC_CXX_RUNTIME=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
