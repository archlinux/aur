# Maintainer: fam007e <faisalmoshiur+secpasswdmgmt@gmail.com>
pkgname=securepasswd_mgmt
pkgver=2026.11.10
pkgrel=2
pkgdesc="A secure, cross-platform password manager with TOTP support"
arch=('x86_64')
url="https://github.com/fam007e/SecurePasswd_MGMT"
license=('MIT')
depends=('libsodium' 'argon2' 'sqlcipher' 'qt6-base' 'qt6-svg' 'openssl'
         'curl' 'libcsv' 'hicolor-icon-theme')
makedepends=('cmake' 'cmocka')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/SecurePasswd_MGMT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3df093f4eb0338d332d3ca28df8f6ab919d6192b2b4a9c349f11c003dabde5b')

build() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPROJECT_VERSION=${pkgver}
    cmake --build build
}

check() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "$srcdir/SecurePasswd_MGMT-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
