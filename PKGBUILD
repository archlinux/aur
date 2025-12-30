# Maintainer: MCB-SMART-BOY <2720838051@qq.com>
pkgname=neve-git
pkgver=0.5.0.r5.gda4a934
pkgrel=1
pkgdesc="A pure functional language for system configuration and package management"
arch=('x86_64' 'aarch64')
url="https://github.com/MCB-SMART-BOY/Neve"
license=('MPL-2.0')
depends=('gcc-libs' 'libgit2' 'libssh2' 'openssl' 'zlib' 'xz')
makedepends=('git' 'rust' 'cargo' 'pkg-config')
provides=('neve')
conflicts=('neve')
source=("git+https://github.com/MCB-SMART-BOY/Neve.git")
sha256sums=('SKIP')

pkgver() {
    cd Neve
    printf "0.6.3.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd Neve
    export LIBGIT2_NO_VENDOR=1
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo build --release -p neve
}

check() {
    cd Neve
    cargo test --release -p neve-lexer -p neve-parser -p neve-eval -p neve-typeck -p neve-fmt
}

package() {
    cd Neve
    install -Dm755 "target/release/neve" "$pkgdir/usr/bin/neve"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
