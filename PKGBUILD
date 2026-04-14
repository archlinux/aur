# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve
pkgver=2.0.0
pkgrel=1
pkgdesc="Standalone language for system configuration, builds, and shell automation"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs' 'libgit2' 'libssh2' 'openssl' 'zlib' 'xz')
makedepends=('rust' 'cargo' 'pkg-config')
provides=("neve=${pkgver}")
conflicts=('neve-bin' 'neve-git')
source=("neve-${pkgver}.tar.gz::https://github.com/MCB-SMART-BOY/Neve/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad0a93cacbf82e1d31c7671ea0d81e62519842931e19724bcc3f2354d2f6ac74')

build() {
    cd "Neve-${pkgver}"
    export LIBGIT2_NO_VENDOR=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --release -p neve
}

package() {
    cd "Neve-${pkgver}"
    install -Dm755 "target/release/neve" "$pkgdir/usr/bin/neve"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
