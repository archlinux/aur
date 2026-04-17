# Maintainer: sourceturner <sourceturner at gmx dot net>

pkgbase=oo7
pkgname=(
    cargo-credential-oo7
    oo7-cli
    oo7-daemon
    oo7-pam
    oo7-portal)
pkgver=0.6.0
pkgrel=1
pkgdesc="Secret Service provider"
arch=(x86_64)
url="https://github.com/linux-credentials/oo7"
license=(MIT)
makedepends=(cargo)
depends=('libgcc' 'glibc')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/linux-credentials/oo7/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('793de2494423b3f3cc2457f69bca1c17ce90497dbe2eb26d9c717b1d166fee36')

prepare() {
    cd $pkgbase-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd $pkgbase-$pkgver
    export CARGO_TARGET_DIR=target
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package_cargo-credential-oo7() {
    pkgdesc="Cargo credential provider built using oo7"
    cd $pkgbase-$pkgver
    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}

package_oo7-cli() {
    pkgdesc="CLI application to interact with the system keyring"
    cd $pkgbase-$pkgver
    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}

package_oo7-daemon() {
    pkgdesc="Service providing the Secret Service D-Bus API"
    cd $pkgbase-$pkgver
    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
package_oo7-pam() {
    pkgdesc="PAM module for oo7 Secret Service integration"
    cd $pkgbase-$pkgver
    install -Dm0755 target/release/libpam_oo7.so $pkgdir/usr/lib/security/pam_oo7.so
    install -Dm0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}

package_oo7-portal() {
    pkgdesc="org.freedesktop.impl.portal.Secret implementation using oo7"
    cd $pkgbase-$pkgver
    install -Dm0755 -t $pkgdir/usr/bin/ target/release/$pkgname
    install -Dm0644 -t $pkgdir/usr/share/licenses/$pkgname/ LICENSE
}
