pkgname=pam_pinlock
pkgver=1.1.0
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
sha256sums=('74678c4863f21a3795631badfc4957fe83d74b3a2d15b835e697f4f558ef4122')

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
