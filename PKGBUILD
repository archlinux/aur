pkgname=pam_pinlock
pkgver=1.0.0
pkgrel=3
pkgdesc="Secure, feature-rich PIN-based PAM module for Linux"
arch=('x86_64')
url="https://github.com/saltnpepper97/pam_pinlock"
license=('MIT')
depends=('pam' 'argon2')
options=('!debug')
makedepends=('git' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/pam_pinlock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('900e4e5f382085219c067a08e427c7443200786223254a01c9a1a36256cb3a18')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "pam_pinlock.so" "$pkgdir/usr/lib/security/pam_pinlock.so"
    install -Dm755 "pinlockctl" "$pkgdir/usr/bin/pinlockctl"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "examples/pinlock.conf" "$pkgdir/etc/pinlock.conf"
}
