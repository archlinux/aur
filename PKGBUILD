# Maintainer: fam007e <faisalmoshiur+secpasswdmgmt@gmail.com>
pkgname=securepasswd_mgmt
pkgver=2026.11.10
pkgrel=1
pkgdesc="A secure, cross-platform password manager with TOTP support"
arch=('x86_64')
url="https://github.com/fam007e/SecurePasswd_MGMT"
license=('MIT')
depends=('libsodium' 'argon2' 'sqlcipher' 'qt6-base' 'qt6-svg' 'openssl'
         'curl' 'libcsv' 'hicolor-icon-theme')
makedepends=('cmake' 'cmocka')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/SecurePasswd_MGMT/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('720f99c30e04eaf56ad9fd4d26deee823b89078f5477ce188f0bae49f40e042a')

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
