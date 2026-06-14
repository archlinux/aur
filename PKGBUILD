pkgname=pam_pinlock
pkgver=1.2.0
pkgrel=1
pkgdesc="Secure, feature-rich PIN-based PAM module for Linux"
arch=('x86_64')
url="https://github.com/saltnpepper97/pam_pinlock"
license=('MIT')
depends=('pam' 'argon2')
options=('!debug')
backup=('etc/pinlock.conf')
makedepends=('git' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/saltnpepper97/pam_pinlock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('802c810892d011b7eef7e6393687b2e4ea9356a20d5a728667324bc1aa495dab')

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
